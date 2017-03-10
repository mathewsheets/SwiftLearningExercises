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
ints.add(item: 1)
ints.add(item: 2)
ints.add(item: 3)
ints.add(item: 4)
ints.add(item: 5)
ints.add(item: 6)
print("removed: \(ints.remove(item: 6)!)")
print("ints has \(ints.count) elements")

finder.each(items: ints.items) { print($0) }

print("----String data type----")
var strings = Database<String>()
strings.add(item: "One")
strings.add(item: "Two")
strings.add(item: "Three")
strings.add(item: "Four")
strings.add(item: "Five")
strings.add(item: "Six")
print("removed: \(strings.remove(item: "Six")!)")
print("strings has \(strings.count) elements")

let stringLengths = finder.pluck(items: strings.items) { return $0.characters.count }
print(stringLengths)

print("----Person data type----")

var persons = Database<Person>()
persons.add(item: Person(first: "Bobby", last: "Joe"))
persons.add(item: Person(first: "Samantha", last: "Sue"))
persons.add(item: Person(first: "Forest", last: "Gump"))

let lastNameLessThen4 = finder.all(items: persons.items) { $0.last.characters.count < 4}
print(lastNameLessThen4)
