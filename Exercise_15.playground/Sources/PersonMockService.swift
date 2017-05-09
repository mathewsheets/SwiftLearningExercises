import Foundation

public class PersonMockService: PersonService {
    
    var persons = [Person]()
    
    public init() {
        
        let person1 = Person()
        person1.id = "65372789-c4a8-4fd2-8480-2cf771e9b0bd"
        person1.first = "Mathew"
        person1.last = "Mock"
        person1.phone = "1-555-555-5555"
        
        self.persons.append(person1)
    }
    
    public func getPersons(completion: @escaping (HandlerPersons) -> Void) throws {
        
        completion() {
            
            return persons
        }
    }
}
