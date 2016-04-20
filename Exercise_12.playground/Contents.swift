/*:
 * callout(Exercise): Build upon your simple bank teller system by using extensions. Examine your solution, identity properties and/or methods that would be good candidates for creating an extension. Did you use inheritance? See where you can use extensions in place of inheritance. Where you are specifying protocol conformance, see if extensions can be leveraged.
 
 **Constraints:**
 - Use extensions instead of inheritance
 - Use extensions to make types more natural in the system
 - Use a protocol extension to provide default implementations
 */
import Foundation

var teller: Teller? = Teller(name: "Annie")
teller?.auditDelegate = AuditDefaultDelegate()

teller?.handle(Customer(name: "Matt"))
do {
    try teller?.openCheckingAccount()
    
    let account = teller!.customer!.checking!
    
    try teller?.credit(100.00, account: account)
    print(account.description)
    
    try teller?.debit(99.00, account: account)
    print(account.description)
    
//    try teller?.debit(2.00, account: account)
//    print(account.description)
    
    try teller?.done()
    
} catch TransactionError.NoCustomer {
    print("ERROR: teller is not handling a customer")
} catch TransactionError.InsufficientFunds(let balance, let debiting) {
    print("ERROR: transaction error: debiting \(debiting), balance = \(balance)")
}

teller?.handle(Customer(name: "Sam"))
do {
    try teller?.openSavingsAccount()
    
    let account = teller!.customer!.savings!
    
    try teller?.debit(100.00, account: account)
    print(account.description)
    
    try teller?.credit(600.00, account: account)
    print(account.description)
    
    if let savings = account as? SavingsAccount {
        
        savings.applyInterest()
    }
    print(account.description)
    
    try teller?.done()
    
} catch TransactionError.NoCustomer {
    print("ERROR: teller is not handling a customer")
} catch TransactionError.InsufficientFunds(let balance, let debiting) {
    print("ERROR: transaction error: debiting \(debiting), balance = \(balance)")
}

teller = nil
