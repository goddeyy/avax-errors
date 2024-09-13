# Investment Fund

## Overview

The **Investment Fund** smart contract is designed to facilitate investments into multiple projects with strict management and control. This contract allows a fund manager to create projects, accept contributions from investors, and withdraw funds as needed. It incorporates robust error handling using `require`, `assert`, and `revert` to ensure the integrity and correctness of the investment process.

## Features

- **Project Management**: Fund manager can create projects with a specified maximum contribution limit.
- **Investment Handling**: Investors can contribute to projects, with checks to ensure contributions do not exceed project limits.
- **Fund Withdrawal**: The fund manager can withdraw accumulated funds from projects.
- **Internal Consistency Checks**: Ensures the contract's state remains consistent with expected conditions using `assert`.

## Contract Structure

### State Variables

- `address public fundManager`: The address of the fund manager (creator of the contract).
- `uint256 public totalFund`: Total amount of funds held by the contract.
- `mapping(address => Project) public projects`: Mapping of project addresses to their respective `Project` struct.
- `mapping(address => uint256) public investorContributions`: Tracking of individual investor contributions.

### Structs

- `struct Project`: Defines a project with the following fields:
  - `uint256 totalContribution`: Total contributions received for the project.
  - `uint256 maxContribution`: Maximum allowable contribution for the project.


## Functions

### Constructor

- **`constructor()`**: Initializes the fund manager as the contract deployer.

### Modifiers

- **`onlyManager`**: Ensures that only the fund manager can perform specific actions.

### Project Management

- **`createProject(address _projectAddress, uint256 _maxContribution)`**: Allows the fund manager to create a new project with a specified maximum contribution limit. Reverts if the project already exists or if the input values are invalid.

### Contribution Handling

- **`contribute(address _projectAddress)`**: Allows investors to contribute to a specified project. The contribution is checked against the project’s maximum limit and previous contributions. Reverts if the contribution exceeds the limit or if the project does not exist.

### Fund Withdrawal

- **`withdrawFunds(address _projectAddress)`**: Allows the fund manager to withdraw all accumulated funds from a specified project. Reverts if the project does not exist or if there are no funds to withdraw.

### Helper Functions

- **`getProjectStatus(address _projectAddress)`**: Returns the total and maximum contributions for a specified project.

## Example Usage

1. **Deploy the Contract**: Deploy the `InvestmentFund` contract using any Ethereum-compatible deployment tool (e.g., Remix, Hardhat).

2. **Create Projects**: The fund manager creates projects with `createProject` by specifying the project address and maximum contribution limit.

3. **Contribute to Projects**: Investors contribute to projects using the `contribute` function. The contract ensures contributions are within the allowed limits.

4. **Withdraw Funds**: The fund manager can withdraw accumulated funds from projects using `withdrawFunds`.

5. **Check Project Status**: Use `getProjectStatus` to view the current state of a project.

## Error Handling

- **`require`**: Used for input validation and condition checks. Reverts the transaction with an error message if conditions are not met.
- **`assert`**: Used for internal consistency checks. It ensures that the contract's state remains valid and correct.
- **`revert`**: Provides detailed error messages and reverts transactions under specific conditions.

## License

This contract is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
