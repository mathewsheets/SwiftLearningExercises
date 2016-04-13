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
        
        try! openAccount(safeCustomer.checking!)
    }
    
    public func openSavingsAccount() throws  {
        guard let safeCustomer = customer else {
            throw TransactionError.NoCustomer
        }
    
        safeCustomer.savings = SavingsAccount(customer: safeCustomer)
        
        try! openAccount(safeCustomer.savings!)
    }
    
    func openAccount(account: Account) throws {
        guard let safeCustomer = customer else {
            throw TransactionError.NoCustomer
        }

        auditDelegate?.willPerform(Action.Open, customer: safeCustomer, account: account)
        auditDelegate?.performing(Action.Open, customer: safeCustomer, account: account)
        auditDelegate?.didPerform(Action.Open, customer: safeCustomer, account: account)
    }
    
    public func credit(amount: Double, account: Account) throws {
        guard let safeCustomer = customer else {
            throw TransactionError.NoCustomer
        }
        
        auditDelegate?.willPerform(Action.Credit, customer: safeCustomer, account: account)
        
        auditDelegate?.performing(Action.Credit, customer: safeCustomer, account: account)
        account.credit(amount)

        auditDelegate?.didPerform(Action.Credit, customer: safeCustomer, account: account)
    }

    public func debit(amount: Double, account: Account) throws {
        guard let safeCustomer = customer else {
            throw TransactionError.NoCustomer
        }
        
        auditDelegate?.willPerform(Action.Debit, customer: safeCustomer, account: account)
        
        auditDelegate?.performing(Action.Debit, customer: safeCustomer, account: account)
        try account.debit(amount)
        
        auditDelegate?.didPerform(Action.Debit, customer: safeCustomer, account: account)
    }
    
    public func done() throws {
        guard let safeCustomer = customer else {
            throw TransactionError.NoCustomer
        }

        auditDelegate?.willPerform(Action.Done, customer: safeCustomer, account: nil)
        
        auditDelegate?.performing(Action.Done, customer: safeCustomer, account: nil)
        customer = nil
        
        auditDelegate?.didPerform(Action.Done, customer: safeCustomer, account: nil)
    }
}
