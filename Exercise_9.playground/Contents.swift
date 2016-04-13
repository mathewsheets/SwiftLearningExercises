/*:
 * callout(Exercise): Build upon your `Dog` and `Cat` classes in the previous exercise by applying the appropriate access control for each class/structure member. Add a `Owner` class that contains a collection of `Dog` instances and `Cat` instances. Have your `Dog` and `Cat` hold the correct reference type to an `Owner` instance. The `Ower` property of the `Cat` instance reference is optional. Provide a `subscript` to interact with your `Dog` and `Cat` instances.
 
 **Constraints:**
 - Use `weak`
 - Use `unowned`
 - Use `subscript`
 - Create a `convenience` initializer for creating your `Dog` and `Cat` instance
 */
import Foundation

var matt: Owner? = Owner(name: "Matt")

print(matt!.description)

matt!.addDog(Dog(breed: "Greyhound", color: "fawn", age: 6, name: "Fido", owner: matt!))
matt!.addCat(Cat(breed: "Siamese", color: "white", age: 8, name: "Snowy"))

if let dog = matt?[0, .Dog]?.0 {
    
    print("\(dog.description)")
}

if let cat = matt?[0, .Cat]?.1 {
    
    print("\(cat.description)")
}
print(matt!.description)

matt = nil
