/*:
 * callout(Exercise): Using the data types in your Container from Exercise 13, create the appropriate JSON payload. Deserialize the JSON payload into instances of your data types and populate your container. Then serialize the instances back into a JSON payload.
 
 **Constraints:**
 - New methods where appropriate to deserialize and serialize the data in your container.
 */
import Foundation

var finder = DataFinder()

print("----Int data type----")
var ints = Database<Int>()
ints.deserialize("ints.json") { (item) -> Int in
    
    return item as! Int
}

finder.each([ints.items]) { print($0.item) }

let intsJSONPayload = ints.serialize { return Array($0) }
print(intsJSONPayload!)

print("----String data type----")
var strings = Database<String>()
strings.deserialize("strings.json") { (item) -> String in
    
    return item as! String
}

finder.each([strings.items]) { print($0.item) }

let stringsJSONPayload = strings.serialize { return Array($0) }
print(stringsJSONPayload!)

print("----Person data type----")
var persons = Database<Person>()
persons.deserialize("persons.json") { (item) -> Person in
    
    let person = Person()
    
    person.id = item["id"] as? String
    
    if let nameDict = item["name"] as? [String:AnyObject] {
        
        person.name = Name()
        
        person.name!.first = nameDict["first"] as? String
        person.name!.middle = nameDict["middle"] as? String
        person.name!.last = nameDict["last"] as? String
        
        if let prefix = nameDict["prefix"] as? String {
            
            person.name!.prefix = NamePrefix(rawValue: prefix)
        }
        if let suffix = nameDict["suffix"] as? String {
            
            person.name!.suffix = NameSuffix(rawValue: suffix)
        }
    }
    
    person.phone = item["phone"] as? String
    person.company = item["company"] as? String
    person.title = item["title"] as? String
    
    if let addressDict = item["address"] as? [String:AnyObject]  {
        
        let address = Address()
        
        person.address = address
        
        if let coordinateDict = addressDict["coordinate"] as? [String:Double] {
            
            let latitude = coordinateDict["latitude"]
            let longitude = coordinateDict["longitude"]
            
            address.coordinate = Coordinate(latitude: latitude!, longitude: longitude!)
        }
        
        person.address!.street1 = addressDict["street1"] as? String
        person.address!.street2 = addressDict["street2"] as? String
        person.address!.city = addressDict["city"] as? String
        person.address!.county = addressDict["county"] as? String
        person.address!.state = addressDict["state"] as? String
        person.address!.country = addressDict["country"] as? String
    }
    
    return person
}

finder.each(Array(persons.items)) { print("\($0.item.description)\n") }

let personsJSONPayload = persons.serialize { (items) -> AnyObject in
    
    return Array(items).asDictionary
}

print(personsJSONPayload!)
