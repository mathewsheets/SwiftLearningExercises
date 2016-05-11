import Foundation

public enum NamePrefix: String {
    case Mr
    case Ms
    case Mrs
}

public enum NameSuffix: String {
    case Jr
    case Sr
}

public class Name {
    
    public var first: String?
    public var middle: String?
    public var last: String?
    public var prefix: NamePrefix?
    public var suffix: NameSuffix?
    
    public init() {
        
    }
    
    var asDictionary: [String:AnyObject] {
        
        var dictionary = [String:AnyObject]()
        
        dictionary["first"] = first
        dictionary["middle"] = middle
        dictionary["last"] = last
        dictionary["prefix"] = prefix?.rawValue
        dictionary["suffix"] = suffix?.rawValue
        
        return dictionary
    }
}

public struct Coordinate {
    
    public var latitude: Double?
    public var longitude: Double?
    
    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    var asDictionary: [String:AnyObject] {
        
        var dictionary = [String:AnyObject]()
        
        dictionary["latitude"] = latitude
        dictionary["longitude"] = longitude
        
        return dictionary
    }
}

public class Address {
    
    public var coordinate: Coordinate?
    public var street1: String?
    public var street2: String?
    public var city: String?
    public var county: String?
    public var state: String?
    public var country: String?
    
    public init() {
        
    }
    
    var asDictionary: [String:AnyObject] {
        
        var dictionary = [String:AnyObject]()
        
        dictionary["coordinate"] = coordinate?.asDictionary
        dictionary["street1"] = street1
        dictionary["street2"] = street2
        dictionary["city"] = city
        dictionary["county"] = county
        dictionary["state"] = state
        dictionary["country"] = country

        return dictionary
    }
}

public class Person {

    public var id: String?
    public var name: Name?
    public var phone: String?
    public var company: String?
    public var title: String?
    public var address: Address?
    
    public init() {
        
    }
    
    public init(dictionary: [String:AnyObject]) {
        
        id = dictionary["id"] as? String
        
        if let nameDict = dictionary["name"] as? [String:AnyObject] {
            
            name = Name()
            
            name!.first = nameDict["first"] as? String
            name!.middle = nameDict["middle"] as? String
            name!.last = nameDict["last"] as? String
            
            if let prefix = nameDict["prefix"] as? String {
                
                name!.prefix = NamePrefix(rawValue: prefix)
            }
            if let suffix = nameDict["suffix"] as? String {
                
                name!.suffix = NameSuffix(rawValue: suffix)
            }
        }
        
        phone = dictionary["phone"] as? String
        company = dictionary["company"] as? String
        title = dictionary["title"] as? String
        
        if let addressDict = dictionary["address"] as? [String:AnyObject]  {
            
            address = Address()
            
            if let coordinateDict = addressDict["coordinate"] as? [String:Double] {
                
                let latitude = coordinateDict["latitude"]
                let longitude = coordinateDict["longitude"]
                
                address!.coordinate = Coordinate(latitude: latitude!, longitude: longitude!)
            }
            
            address!.street1 = addressDict["street1"] as? String
            address!.street2 = addressDict["street2"] as? String
            address!.city = addressDict["city"] as? String
            address!.county = addressDict["county"] as? String
            address!.state = addressDict["state"] as? String
            address!.country = addressDict["country"] as? String
        }
    }
    
    var asDictionary: [String:AnyObject] {
        
        var dictionary = [String:AnyObject]()
        
        dictionary["id"] = id
        dictionary["name"] = name?.asDictionary
        dictionary["phone"] = phone
        dictionary["company"] = company
        dictionary["title"] = title
        dictionary["address"] = address?.asDictionary
        
        return dictionary
    }
    
    public var description: String {
        
        var nameString = ""
        if name != nil {
            nameString += name?.prefix?.rawValue ?? ""
            nameString += " "
            nameString += name?.first ?? ""
            nameString += " "
            nameString += name?.middle ?? ""
            nameString += " "
            nameString += name?.last ?? ""
            nameString += " "
            nameString += name?.suffix?.rawValue ?? ""
        }
        
        var addressString = ""
        if address != nil {
            addressString += address?.street1 ?? ""
            addressString += " "
            addressString += address?.street2 ?? ""
            addressString += " "
            addressString += address?.city ?? ""
            addressString += " "
            addressString += address?.county ?? ""
            addressString += " "
            addressString += address?.state ?? ""
            addressString += " "
            addressString += address?.country ?? ""
            
            if let safeCoordinate = address?.coordinate {
                addressString += " ("
                addressString += String(safeCoordinate.latitude ?? 0.0)
                addressString += ", "
                addressString += String(safeCoordinate.longitude ?? 0.0)
                addressString += ")"
            }
        }
        
        return "\tid: \(id ?? "")\n\tname: \(nameString)\n\tphone: \(phone ?? "")\n\tcompany: \(company ?? "")\n\ttitle: \(title ?? "")\n\taddress: \(addressString ?? "")"
    }
}

public func ==(lhs: Person, rhs: Person) -> Bool {

    return lhs.description == rhs.description
}

extension Person: Equatable {}

extension Person: Hashable {
    
    public var hashValue: Int {
        
        return description.hashValue
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
