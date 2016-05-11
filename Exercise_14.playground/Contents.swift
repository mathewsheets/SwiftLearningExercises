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

print("----Array of Person data type----")

var persons = Database<Person>()
persons.deserialize("persons.json") { (item) -> Person in
    
    return Person(dictionary: item as! [String : AnyObject])
}

finder.each(Array(persons.items)) { print("\($0.item.description)\n") }

let personsJSONPayload = persons.serialize { Array($0).asDictionary }
print(personsJSONPayload!)
