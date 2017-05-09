import Foundation

public typealias HandlerPersons = () throws -> [Person]

public protocol PersonService {
    
    func getPersons(completion: @escaping (HandlerPersons) -> Void) throws
    
}
