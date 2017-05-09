import Foundation

public class Person {
    
    public var id: String?
    public var first: String?
    public var last: String?
    public var phone: String?
    
    public init() {
        
    }
    
    public init(dictionary: [String:AnyObject]) {
        
        id = dictionary["id"] as? String
        first = dictionary["first"] as? String
        last = dictionary["last"] as? String
        phone = dictionary["phone"] as? String
    }
    
    public var asDictionary: [String:AnyObject] {
        
        var dictionary = [String:AnyObject]()
        
        dictionary["id"] = id as AnyObject?
        dictionary["first"] = first as AnyObject?
        dictionary["last"] = last as AnyObject?
        dictionary["phone"] = phone as AnyObject?
        
        return dictionary
    }
}

extension Person: Equatable {
    
    public static func ==(lhs: Person, rhs: Person) -> Bool {
        
        return lhs.id == rhs.id
    }
    
}

extension Person: Hashable {
    
    public var hashValue: Int {
        
        return id!.hashValue
    }
}

extension Array where Element: Person {
    
    public var asDictionary: [[String:AnyObject]] {
        
        var dictionaries = [[String:AnyObject]]()
        
        for element in self {
            
            dictionaries.append(element.asDictionary)
        }
        
        return dictionaries
    }
}
