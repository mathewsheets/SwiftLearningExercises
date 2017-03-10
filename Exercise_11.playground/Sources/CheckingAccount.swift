import Foundation

public class CheckingAccount: BaseAccount, Account {

    public var description: String {
        
        return "Checking = \(balance)"
    }
    
    deinit {
        
        print("deinit checking")
    }
}
