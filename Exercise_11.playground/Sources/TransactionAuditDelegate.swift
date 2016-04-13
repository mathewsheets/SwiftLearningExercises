import Foundation

public protocol TransactionAuditDelegate {
    
    func willPerform(what: Action, customer: Customer, account: Account?)
    func performing(what: Action, customer: Customer, account: Account?)
    func didPerform(what: Action, customer: Customer, account: Account?)
}
