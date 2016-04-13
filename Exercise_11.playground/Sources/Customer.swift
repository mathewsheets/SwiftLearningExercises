import Foundation

public class Customer {
    
    internal var name: String
    
    public var checking: Account?
    public var savings: Account?
    
    public init(name: String) {
        
        self.name = name
    }
    
    deinit {
        
        print("deinit customer")
    }
}
