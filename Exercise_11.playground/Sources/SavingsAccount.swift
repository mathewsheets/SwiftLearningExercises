import Foundation

public class SavingsAccount: BaseAccount, Account {
    
    public var description: String {
        
        return "Savings = \(balance)"
    }

    private let interest = 2.5
    
    public override init(customer: Customer) {
        
        super.init(customer: customer)
        
        balance = 500.00
    }

    public func applyInterest() {

        balance *= (interest / 100) + 1
    }
    
    deinit {
        
        print("deinit savings")
    }
}
