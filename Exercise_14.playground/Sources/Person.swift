import Foundation

enum NamePrefix: String {
    case Mr
    case Ms
    case Mrs
}

enum NameSuffix: String {
    case Jr
    case Sr
}

class Name {
    
    var first: String?
    var middle: String?
    var last: String?
    var prefix: NamePrefix?
    var suffix: NameSuffix?
}

struct Coordinate {
    
    var latitude: Double?
    var longitude: Double?
}

class Address {
    
    var coordinate: Coordinate?
    var street1: String?
    var street2: String?
    var city: String?
    var county: String?
    var state: String?
    var country: String?
}

public class Person {

    var id: String?
    var name: Name?
    var phone: String?
    var company: String?
    var title: String?
    var address: Address?
    
    var description: String {
        
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
