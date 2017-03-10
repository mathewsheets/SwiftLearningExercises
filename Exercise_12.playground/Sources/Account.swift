import Foundation

public protocol Account {

    var balance: Double { get set }

    var customer: Customer { get }

    func debit(amount: Double) throws

    func credit(amount: Double)

    var description: String { get }
}

extension Account {
    
    public var description: String {

        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: balance))!
    }
}

public class BaseAccount {

    public var balance = 0.0

    public unowned var customer: Customer

    public init(customer: Customer) {

        self.customer = customer
    }
}

extension BaseAccount {

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

public class CheckingAccount: BaseAccount, Account {
    
    deinit {
        
        print("deinit checking")
    }
}

public class SavingsAccount: BaseAccount, Account {
    
    private let interest = 2.5
    
    public override init(customer: Customer) {

        super.init(customer: customer)

        balance = 500.00
    }
    
    public func applyInterest() {
        
        balance *= (interest / 100) + 1
    }
    
    public var description: String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return "\(formatter.string(from: NSNumber(value: balance))!) in Savings with interest = \(interest) annually"
    }
    
    deinit {

        print("deinit savings")
    }
}
