# Wallet Simple Contract

Loom Video Continuation cos of time limit:
https://www.loom.com/share/3a548b26a5a94f0bbc040bc2adce820a?sid=bf0e91d2-1909-4f59-ab49-3b1528fbf824

To illustrate the use of `require()`, `assert()`, and `revert()` statements in a Solidity smart contract, here's a simple example of a smart contract that manages a basic wallet. This wallet will allow deposits, withdrawals, and setting a limit for withdrawals. Each function will demonstrate the use of these statements to handle errors and conditions.

### Explanation:

1. **Constructor:**

   - Sets the `owner` of the contract to the address that deployed the contract.

2. **Modifiers:**

   - `onlyOwner`: Ensures that only the owner of the contract can call the modified function. Uses `require()` to enforce this condition.

3. **Functions:**

   - `deposit()`: Allows users to deposit Ether into their balance in the wallet. Uses `require()` to ensure the deposit amount is greater than zero.
   - `setWithdrawalLimit(uint256 _limit)`: Allows the owner to set a limit for withdrawals. Uses the `onlyOwner` modifier to restrict access.
   - `withdraw(uint256 _amount)`: Allows users to withdraw Ether from their balance. Uses `require()` to ensure the withdrawal amount is greater than zero and that the user has enough balance. Uses `revert()` if the withdrawal amount exceeds the set limit.
   - `contractBalance()`: Returns the contract's balance.
   - `checkOwner()`: Demonstrates the use of `assert()` by checking that the `owner` address is not zero. Since the `owner` is set in the constructor, this condition should always be true.

### Usage of require(), assert(), and revert():

- **`require()`**: Used to validate inputs and conditions. If the condition is not met, the transaction is reverted, and an optional error message is returned.

- **`assert()`**: Used for internal errors and to check for conditions that should never be false. If an `assert()` fails, it indicates a bug in the contract.

- **`revert()`**: Used to revert the transaction with an optional error message. It can be used inside conditional statements to handle specific error cases.

This contract provides a practical example of how to use these statements to handle errors and enforce conditions in a Solidity smart contract.
