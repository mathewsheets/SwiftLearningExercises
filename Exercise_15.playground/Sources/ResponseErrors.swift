import Foundation

public class ResponseErrors: CustomStringConvertible {
    
    public var errors = [ResponseError]()
    
    public var description: String {
        
        return errors[0].message!
    }
    
}
