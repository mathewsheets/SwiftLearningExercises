import Foundation

public class BaseAccount {
    
    public var balance = 0.0
    
    public unowned var customer: Customer

    public init(customer: Customer) {
        
        self.customer = customer
    }
    
    public func debit(amount: Double) throws {
        
        guard (balance - amount) >= 0 else {
            
            throw TransactionError.InsufficientFunds(balance: balance, debiting: amount)
        }
        
        balance -= amount
    }
    
    public func credit(amount: Double) {
        
        balance += amount
    }
}
