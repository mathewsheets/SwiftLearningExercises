import Foundation

public protocol AuditAction {

    var description: String { get }
}

public extension AuditAction {
    
    public var description: String {
        return "\(self)"
    }
}

public enum AuditDelegateAction: AuditAction {
    case Open
    case Debit
    case Credit
    case Done
}

public protocol AuditDelegate {
    
    func willPerform(what: AuditAction, customer: Customer, account: Account?)
    func performing(what: AuditAction, customer: Customer, account: Account?)
    func didPerform(what: AuditAction, customer: Customer, account: Account?)
}

extension AuditDelegate {
    
    public func willPerform(what: AuditAction, customer: Customer, account: Account?) {
        
        if (account != nil) {
            print("will perform \(what.description) for customer \(customer.name): balance = \(account!.description).")
        } else {
            print("will perform \(what.description) for customer \(customer.name).")
        }
    }
    
    public func performing(what: AuditAction, customer: Customer, account: Account?) {
        
        if (account != nil) {
            print("performing \(what.description) for customer \(customer.name): balance = \(account!.description).")
        } else {
            print("performing \(what.description) for customer \(customer.name).")
        }
    }
    
    public func didPerform(what: AuditAction, customer: Customer, account: Account?) {
        
        if (account != nil) {
            print("did perform \(what.description) for customer \(customer.name): balance = \(account!.description).")
        } else {
            print("did perform \(what.description) for customer \(customer.name).")
        }
    }
}

public class AuditDefaultDelegate: AuditDelegate {
    
    public init() {
        
    }

    deinit {
        
        print("deinit delegate")
    }
}
