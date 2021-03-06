import Foundation

public class Teller {
    
    private var name: String
    
    public var customer: Customer?
    public var auditDelegate: AuditDelegate?

    public init(name: String) {
        
        self.name = name
    }
    
    deinit {
        
        print("deinit teller")
    }
    
    public func handle(customer: Customer) {
        
        self.customer = customer
    }

    public func done() throws {
        guard let safeCustomer = customer else {
            throw TransactionError.NoCustomer
        }

        auditDelegate?.willPerform(what: AuditDelegateAction.Done, customer: safeCustomer, account: nil)
        
        auditDelegate?.performing(what: AuditDelegateAction.Done, customer: safeCustomer, account: nil)
        customer = nil
        
        auditDelegate?.didPerform(what: AuditDelegateAction.Done, customer: safeCustomer, account: nil)
    }
}

extension Teller {

    func openAccount(account: Account) throws {
        guard let safeCustomer = customer else {
            throw TransactionError.NoCustomer
        }
        
        auditDelegate?.willPerform(what: AuditDelegateAction.Open, customer: safeCustomer, account: account)
        auditDelegate?.performing(what: AuditDelegateAction.Open, customer: safeCustomer, account: account)
        auditDelegate?.didPerform(what: AuditDelegateAction.Open, customer: safeCustomer, account: account)
    }
}

// Teller Duties

extension Teller {

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

    public func credit(amount: Double, account: Account) throws {
        guard let safeCustomer = customer else {
            throw TransactionError.NoCustomer
        }
        
        auditDelegate?.willPerform(what: AuditDelegateAction.Credit, customer: safeCustomer, account: account)
        
        auditDelegate?.performing(what: AuditDelegateAction.Credit, customer: safeCustomer, account: account)
        account.credit(amount: amount)
        
        auditDelegate?.didPerform(what: AuditDelegateAction.Credit, customer: safeCustomer, account: account)
    }
    
    public func debit(amount: Double, account: Account) throws {
        guard let safeCustomer = customer else {
            throw TransactionError.NoCustomer
        }
        
        auditDelegate?.willPerform(what: AuditDelegateAction.Debit, customer: safeCustomer, account: account)
        
        auditDelegate?.performing(what: AuditDelegateAction.Debit, customer: safeCustomer, account: account)
        try account.debit(amount: amount)
        
        auditDelegate?.didPerform(what: AuditDelegateAction.Debit, customer: safeCustomer, account: account)
    }
}
