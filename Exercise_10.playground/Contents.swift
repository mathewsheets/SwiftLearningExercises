/*:
 * callout(Exercise): Build upon your `Dog` and `Cat` classes in the previous exercise by applying inheritance. Create a superclass that both `Dog` and `Cat` can inherit from. Modify your `Owner` class to hold a collection of pets. Iterate over your pets and print what sound the pet makes.
 
 **Constraints:**
 - Create a new class as the superclass to `Dog` and `Cat`
 - The superclass needs to have a method of `makeSound()`
 - The subclasses needs to override the `makeSound()` method and print the appropriate sound
 - The `pets` property of the `Owner` class needs to store both `Dog` and `Cat` instances
 */
import Foundation

var matt: Owner? = Owner(name: "Matt")

print(matt!.description)

matt?.addPet(pet: Dog(breed: "Greyhound", color: "fawn", age: 6, name: "Fido", owner: matt!))
matt?.addPet(pet: Cat(breed: "Siamese", color: "white", age: 8, name: "Snowy", owner: matt!))

for pet in matt!.pets {

    print("\(pet.description)")

    pet.makeSound()
    
    if let dog = pet as? Dog {
        dog.barking(loudness: .Soft)
    }
    
}

print(matt!.description)

matt = nil
