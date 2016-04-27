/*:
 * callout(Exercise): Based on session [More Functions](More%20Functions) and Exercise 6, create a container that can store any type but provide methods to add/remove and query for instances of any type. Leverage the functions you created in Exercise 6, but create them as generic methods.
 
 **Constraints:**
 - Create a protocol for your container to conform to
 - Create a generic container to store any type
 - Add methods to add/remove instances
 - Add the follow methods for querying
     - `each` = Iterate over each element in the array
     - `all` = Returns true if all of the elements is not false
     - `any` = Returns true if at least one of the elements is not false
     - `contains` = Returns true if the element is present
     - `indexOf` = Returns the index at which element can be found
     - `filter` = Returns an array of all the elements that pass a truth test
     - `reject` = Returns the elements in the array without the elements that pass a truth test
     - `pluck` = Returns an array of a specific value from all the elements
 */
import Foundation

var finder = DataFinder()

print("----Int data type----")
var ints = Database<Int>()
ints.addItem(1)
ints.addItem(2)
ints.addItem(3)
ints.addItem(4)
ints.addItem(5)
ints.addItem(6)
print("removed: \(ints.removeItem(6)!)")
print("ints has \(ints.count) elements")

finder.each(ints.items) { print($0.item) }

print("----String data type----")
var strings = Database<String>()
strings.addItem("One")
strings.addItem("Two")
strings.addItem("Three")
strings.addItem("Four")
strings.addItem("Five")
strings.addItem("Six")
print("removed: \(strings.removeItem("Six")!)")
print("strings has \(strings.count) elements")

let stringLengths = finder.pluck(strings.items) { return $0.characters.count }
print(stringLengths)

print("----Person data type----")
class Person: Equatable {
    
    var first: String
    var last: String
    
    init(first: String, last: String){
        self.first = first
        self.last = last
    }
}

func ==(lhs: Person, rhs: Person) -> Bool {
    
    return lhs.first == rhs.first && lhs.last == rhs.last
}

var persons = Database<Person>()
persons.addItem(Person(first: "Bobby", last: "Joe"))
persons.addItem(Person(first: "Samantha", last: "Sue"))
persons.addItem(Person(first: "Forest", last: "Gump"))

let lastNameLessThen4 = finder.all(persons.items) { $0.last.characters.count < 4}
print(lastNameLessThen4)
