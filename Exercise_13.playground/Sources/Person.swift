import Foundation

public class Person {

    public var first: String
    public var last: String
    
    public init(first: String, last: String){
        self.first = first
        self.last = last
    }
}

extension Person: Equatable {

    public static func ==(lhs: Person, rhs: Person) -> Bool {
        
        return lhs.first == rhs.first && lhs.last == rhs.last
    }

}

extension Person: Hashable {
    
    public var hashValue: Int {
        
        return "\(first)\(last)".hashValue
    }
}
