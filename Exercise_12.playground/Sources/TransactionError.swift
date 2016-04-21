import Foundation

public enum TransactionError {
    case InsufficientFunds(balance: Double, debiting: Double)
    case NoCustomer
}

extension TransactionError: ErrorType {}
