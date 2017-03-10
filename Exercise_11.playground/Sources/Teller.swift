import Foundation

public class Teller {
    
    private var name: String
    
    public var customer: Customer?
    public var auditDelegate: TransactionAuditDelegate?

    public init(name: String) {
        
        self.name = name
    }
    
    deinit {
        
        print("deinit teller")
    }
    
    public func handle(customer: Customer) {
        
        self.customer = customer
    }

    public func openCheckingAccount() throws  {
        guard let safeCustomer = customer else {
            throw TransactionError.NoCustomer
        }
    
        safeCustomer.checking = CheckingAccount(customer: safeCustomer)
        
        try! openAccount(account: safeCustomer.checking!)
    }
    
    public func openSavingsAccount() throws  {
        guard let safeCustomer = customer else {
            throw TransactionError.NoCustomer
        }
    
        safeCustomer.savings = SavingsAccount(customer: safeCustomer)
        
        try! openAccount(account: safeCustomer.savings!)
    }
    
    func openAccount(account: Account) throws {
        guard let safeCustomer = customer else {
            throw TransactionError.NoCustomer
        }

        auditDelegate?.willPerform(what: Action.Open, customer: safeCustomer, account: account)
        auditDelegate?.performing(what: Action.Open, customer: safeCustomer, account: account)
        auditDelegate?.didPerform(what: Action.Open, customer: safeCustomer, account: account)
    }
    
    public func credit(amount: Double, account: Account) throws {
        guard let safeCustomer = customer else {
            throw TransactionError.NoCustomer
        }
        
        auditDelegate?.willPerform(what: Action.Credit, customer: safeCustomer, account: account)
        
        auditDelegate?.performing(what: Action.Credit, customer: safeCustomer, account: account)
        account.credit(amount: amount)

        auditDelegate?.didPerform(what: Action.Credit, customer: safeCustomer, account: account)
    }

    public func debit(amount: Double, account: Account) throws {
        guard let safeCustomer = customer else {
            throw TransactionError.NoCustomer
        }
        
        auditDelegate?.willPerform(what: Action.Debit, customer: safeCustomer, account: account)
        
        auditDelegate?.performing(what: Action.Debit, customer: safeCustomer, account: account)
        try account.debit(amount: amount)
        
        auditDelegate?.didPerform(what: Action.Debit, customer: safeCustomer, account: account)
    }
    
    public func done() throws {
        guard let safeCustomer = customer else {
            throw TransactionError.NoCustomer
        }

        auditDelegate?.willPerform(what: Action.Done, customer: safeCustomer, account: nil)
        
        auditDelegate?.performing(what: Action.Done, customer: safeCustomer, account: nil)
        customer = nil
        
        auditDelegate?.didPerform(what: Action.Done, customer: safeCustomer, account: nil)
    }
}
