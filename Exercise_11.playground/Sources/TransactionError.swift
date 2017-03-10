import Foundation

public enum TransactionError: Error {
    
    case InsufficientFunds(balance: Double, debiting: Double)
    case NoCustomer
}
