import Foundation

public enum PersonApiError: Error {
    
    case ServiceNotSet
    case NoData
    case RequestError(message: String)
    case ResponseError(errors: ResponseErrors)
    case Unknown(message: String)
}

public class PersonApi {
    
    public static var personService: PersonService? = PersonMockService()
    
    public static func getPersons(completion: @escaping (HandlerPersons) -> Void) throws {
        
        guard let safePersonService = personService else { throw PersonApiError.ServiceNotSet }
        
        return try safePersonService.getPersons(completion: completion)
    }
}
