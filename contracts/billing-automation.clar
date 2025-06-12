;; Billing Automation Contract
;; Automates energy billing based on usage data

(define-constant ERR_INVALID_RATE (err u400))
(define-constant ERR_BILLING_EXISTS (err u401))
(define-constant ERR_INSUFFICIENT_DATA (err u402))

;; Data structures
(define-map billing-rates
  { utility-id: uint, rate-type: (string-ascii 10) }
  {
    rate-per-kwh: uint,
    peak-multiplier: uint,
    base-charge: uint,
    effective-date: uint
  }
)

(define-map monthly-bills
  { meter-id: (string-ascii 20), billing-period: uint }
  {
    energy-charges: uint,
    demand-charges: uint,
    base-charges: uint,
    total-amount: uint,
    due-date: uint,
    paid: bool
  }
)

;; Public functions
(define-public (set-billing-rate (utility-id uint) (rate-type (string-ascii 10)) (rate-per-kwh uint) (peak-multiplier uint) (base-charge uint))
  (begin
    (asserts! (> rate-per-kwh u0) ERR_INVALID_RATE)
    (asserts! (> peak-multiplier u0) ERR_INVALID_RATE)

    (map-set billing-rates
      { utility-id: utility-id, rate-type: rate-type }
      {
        rate-per-kwh: rate-per-kwh,
        peak-multiplier: peak-multiplier,
        base-charge: base-charge,
        effective-date: block-height
      }
    )
    (ok true)
  )
)

(define-public (generate-bill (meter-id (string-ascii 20)) (billing-period uint) (utility-id uint) (total-kwh uint) (peak-kwh uint))
  (let ((rate (unwrap! (map-get? billing-rates { utility-id: utility-id, rate-type: "standard" }) ERR_INVALID_RATE))
        (energy-charges (calculate-energy-charges total-kwh peak-kwh rate))
        (demand-charges (calculate-demand-charges peak-kwh rate))
        (base-charges (get base-charge rate))
        (total-amount (+ energy-charges (+ demand-charges base-charges))))

    (asserts! (> total-kwh u0) ERR_INSUFFICIENT_DATA)
    (asserts! (is-none (map-get? monthly-bills { meter-id: meter-id, billing-period: billing-period })) ERR_BILLING_EXISTS)

    (map-set monthly-bills
      { meter-id: meter-id, billing-period: billing-period }
      {
        energy-charges: energy-charges,
        demand-charges: demand-charges,
        base-charges: base-charges,
        total-amount: total-amount,
        due-date: (+ block-height u720), ;; 30 days
        paid: false
      }
    )
    (ok total-amount)
  )
)

(define-public (mark-bill-paid (meter-id (string-ascii 20)) (billing-period uint))
  (let ((bill (unwrap! (map-get? monthly-bills { meter-id: meter-id, billing-period: billing-period }) ERR_INSUFFICIENT_DATA)))
    (map-set monthly-bills
      { meter-id: meter-id, billing-period: billing-period }
      (merge bill { paid: true })
    )
    (ok true)
  )
)

;; Private functions
(define-private (calculate-energy-charges (total-kwh uint) (peak-kwh uint) (rate { rate-per-kwh: uint, peak-multiplier: uint, base-charge: uint, effective-date: uint }))
  (let ((regular-kwh (- total-kwh peak-kwh))
        (regular-charges (* regular-kwh (get rate-per-kwh rate)))
        (peak-charges (* peak-kwh (* (get rate-per-kwh rate) (get peak-multiplier rate)))))
    (+ regular-charges peak-charges)
  )
)

(define-private (calculate-demand-charges (peak-kwh uint) (rate { rate-per-kwh: uint, peak-multiplier: uint, base-charge: uint, effective-date: uint }))
  (* peak-kwh u5) ;; Simple demand charge calculation
)

;; Read-only functions
(define-read-only (get-billing-rate (utility-id uint) (rate-type (string-ascii 10)))
  (map-get? billing-rates { utility-id: utility-id, rate-type: rate-type })
)

(define-read-only (get-bill (meter-id (string-ascii 20)) (billing-period uint))
  (map-get? monthly-bills { meter-id: meter-id, billing-period: billing-period })
)
