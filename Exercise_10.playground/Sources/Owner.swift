import Foundation

public class Owner {
    
    public var name: String
    
    public var pets = [Pet]()
    
    public var description: String {
        
        return "\(name) has \(pets.count) pet(s)."
    }
    
    public init(name: String) {
        
        self.name = name
    }
    
    deinit {
        
        print("\(name) is buried")
    }
    
    public func addPet(pet: Pet) {

        pets.append(pet)
    }

    public subscript(index: Int) -> Pet? {
        
        return pets[index]
    }
}
