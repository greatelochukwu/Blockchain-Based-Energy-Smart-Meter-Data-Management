# Blockchain-Based Energy Smart Meter Data Management

A comprehensive blockchain solution for managing smart meter data, utility verification, usage analysis, billing automation, and conservation tracking using Clarity smart contracts.

## Overview

This system provides a decentralized platform for energy utilities to manage smart meter data with transparency, security, and automated processes. Built on the Stacks blockchain using Clarity smart contracts.

## Features

### 🏢 Utility Verification
- Register and verify energy utility companies
- Manage utility licenses and credentials
- Track utility status and compliance

### 📊 Smart Meter Data Management
- Register smart meters with location tracking
- Record energy consumption readings
- Store power quality metrics (peak demand, power factor)
- Maintain data integrity and audit trails

### 📈 Usage Analysis
- Analyze energy consumption patterns
- Calculate efficiency scores
- Generate consumption alerts
- Track peak vs off-peak usage

### 💰 Billing Automation
- Set flexible billing rates (standard, peak, off-peak)
- Automatically generate monthly bills
- Calculate energy and demand charges
- Track payment status

### 🌱 Conservation Tracking
- Set conservation targets and baselines
- Track energy savings achievements
- Reward conservation efforts
- Monitor environmental impact

## Smart Contracts

### 1. Utility Verification Contract (`utility-verification.clar`)
Manages the registration and verification of energy utility companies.

**Key Functions:**
- `register-utility`: Register a new utility company
- `deactivate-utility`: Deactivate a utility
- `get-utility`: Retrieve utility information
- `is-verified-utility`: Check utility verification status

### 2. Meter Data Contract (`meter-data.clar`)
Handles smart meter registration and data collection.

**Key Functions:**
- `register-meter`: Register a new smart meter
- `record-reading`: Record energy consumption data
- `get-meter`: Retrieve meter information
- `get-reading`: Get specific meter readings

### 3. Usage Analysis Contract (`usage-analysis.clar`)
Analyzes energy usage patterns and generates insights.

**Key Functions:**
- `analyze-usage`: Analyze consumption patterns
- `create-alert`: Generate consumption alerts
- `get-usage-pattern`: Retrieve usage analysis
- `get-alert`: Get alert information

### 4. Billing Automation Contract (`billing-automation.clar`)
Automates the billing process based on usage data.

**Key Functions:**
- `set-billing-rate`: Configure billing rates
- `generate-bill`: Create monthly bills
- `mark-bill-paid`: Update payment status
- `get-bill`: Retrieve billing information

### 5. Conservation Tracking Contract (`conservation-tracking.clar`)
Tracks energy conservation efforts and rewards.

**Key Functions:**
- `set-conservation-target`: Set conservation goals
- `update-conservation-progress`: Track progress
- `claim-reward`: Claim conservation rewards
- `get-total-savings`: Calculate total savings

## Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd energy-smart-meter-blockchain
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

3. Run tests:
   \`\`\`bash
   npm test
   \`\`\`

## Usage

### Deploying Contracts

Deploy the contracts in the following order:
1. `utility-verification.clar`
2. `meter-data.clar`
3. `usage-analysis.clar`
4. `billing-automation.clar`
5. `conservation-tracking.clar`

### Basic Workflow

1. **Register Utility**: Register your utility company
2. **Register Meters**: Add smart meters to the system
3. **Record Data**: Submit meter readings regularly
4. **Analyze Usage**: Generate usage patterns and insights
5. **Generate Bills**: Create automated bills based on consumption
6. **Track Conservation**: Set and monitor conservation goals

## Testing

The project includes comprehensive tests using Vitest:

\`\`\`bash
npm test
\`\`\`

Test coverage includes:
- Contract functionality validation
- Error handling scenarios
- Data integrity checks
- Business logic verification

## Error Codes

### Utility Verification (100-199)
- `100`: ERR_UNAUTHORIZED - Unauthorized access
- `101`: ERR_ALREADY_VERIFIED - Utility already verified
- `102`: ERR_NOT_FOUND - Utility not found

### Meter Data (200-299)
- `200`: ERR_UNAUTHORIZED - Unauthorized access
- `201`: ERR_INVALID_METER - Invalid meter data
- `202`: ERR_INVALID_DATA - Invalid reading data

### Usage Analysis (300-399)
- `300`: ERR_NO_DATA - No data available
- `301`: ERR_INVALID_PERIOD - Invalid time period

### Billing Automation (400-499)
- `400`: ERR_INVALID_RATE - Invalid billing rate
- `401`: ERR_BILLING_EXISTS - Bill already exists
- `402`: ERR_INSUFFICIENT_DATA - Insufficient data for billing

### Conservation Tracking (500-599)
- `500`: ERR_INVALID_TARGET - Invalid conservation target
- `501`: ERR_NO_BASELINE - No baseline data
- `502`: ERR_ALREADY_CLAIMED - Reward already claimed

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Security Considerations

- All contracts include proper access controls
- Input validation is implemented throughout
- Error handling prevents contract failures
- Data integrity is maintained across all operations

## Future Enhancements

- Integration with IoT devices
- Advanced analytics and machine learning
- Mobile application interface
- Multi-utility support
- Carbon credit tracking
- Renewable energy certificates

## Support

For questions or support, please open an issue in the repository or contact the development team.
