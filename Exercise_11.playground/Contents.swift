/*:
 * callout(Exercise): Leveraging protocols and the delegation design pattern, your task is to build a simple bank teller system. The teller’s job responsibilities are to open, credit, debit savings and checking accounts. The teller is not sure what really happens when they perform their responsibilities, it just works.
 
 **Constraints:**
 - Create an audit delegate that tracks when an account is opened, credited and debited
 - Create a protocol for which a savings and checking accounts need to conform
 - Create a teller class with customers and accounts
 - Perform the teller's responsibilities
 */
import Foundation

var teller: Teller? = Teller(name: "Annie")
teller?.auditDelegate = TransactionAuditPrinterDelegate()

teller?.handle(customer: Customer(name: "Matt"))
do {
    try teller?.openCheckingAccount()
    
    let account = teller!.customer!.checking!
    
    try teller?.credit(amount: 100.00, account: account)
    print(account.description)
    
    try teller?.debit(amount: 99.00, account: account)
    print(account.description)
    
//    try teller?.debit(amount: 2.00, account: account)
//    print(account.description)
    
    try teller?.done()

} catch TransactionError.NoCustomer {
    print("ERROR: teller is not handling a customer")
} catch TransactionError.InsufficientFunds(let balance, let debiting) {
    print("ERROR: transaction error: debiting \(debiting), balance = \(balance)")
}

teller?.handle(customer: Customer(name: "Sam"))
do {
    try teller?.openSavingsAccount()
    
    let account = teller!.customer!.savings!
    
    try teller?.debit(amount: 100.00, account: account)
    print(account.description)
    
    try teller?.credit(amount: 600.00, account: account)
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
