import Foundation

public class TransactionAuditPrinterDelegate: TransactionAuditDelegate {

    public init() {
        
    }
    
    deinit {
        
        print("deinit delegate")
    }
    
    public func willPerform(what: Action, customer: Customer, account: Account?) {
        
        if (account != nil) {
            print("will perform \(what) on \(account!.description) account for customer \(customer.name).")
        } else {
            print("will perform \(what) for customer \(customer.name).")
        }
    }
    
    public func performing(what: Action, customer: Customer, account: Account?) {
        
        if (account != nil) {
            print("proforming \(what) on \(account!.description) account for customer \(customer.name).")
        } else {
            print("proforming \(what) for customer \(customer.name).")
        }
    }
    
    public func didPerform(what: Action, customer: Customer, account: Account?) {
        
        if (account != nil) {
            print("did perform \(what) on \(account!.description) account for customer \(customer.name).")
        } else {
            print("did perform \(what) for customer \(customer.name).")
        }
    }
    
}
