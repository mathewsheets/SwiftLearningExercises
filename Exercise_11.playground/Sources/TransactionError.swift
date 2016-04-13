import Foundation

public enum TransactionError: ErrorType {
    case InsufficientFunds(balance: Double, debiting: Double)
    case NoCustomer
}
