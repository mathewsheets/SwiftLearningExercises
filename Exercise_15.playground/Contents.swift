/*:
 * callout(Exercise): Create a Person API by creating a protocol and two classes conforming to the protocol with methods to create, retrieve, update and delete persons. One of the classes should *mock* the HTTP Client for the `GET` routes reading files for the JSON payload. The other class should leverage the above examples.
 
 **Constraints:**
 - Protocol with methods to create, retrieve, update and delete person instances
 - Class conforming to the protocol reading files for the JSON payloads
 - Class conforming to the protocol using URLRequest, URLResponse and URLSession
 - Each method body must use the appropriate example when implementing the HTTP Client class
 - Each method body must use what you learned in [JSON & Instances](JSON%20and%20Instances) to serialize/deserialize a person instances
 */
import Foundation

// NEEDED TO HANDLE RESPONSES
import PlaygroundSupport
PlaygroundSupport.PlaygroundPage.current.needsIndefiniteExecution = true
URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)

//PersonApi.personService = PersonMockService()
PersonApi.personService = PersonHttpService(url: URL(string: "http://cscc-persons.getsandbox.com")!)

print("get all persons")
try! PersonApi.getPersons { (completion: HandlerPersons) in
    do {
        let persons = try completion()
        
        print(persons.asDictionary)
    } catch PersonApiError.ResponseError(let errors) {
        print("Error info: \(errors)")
    } catch  {
        print("Error info: \(error)")
    }
}

print("create a person")
// todo

print("get a single person")
// todo

print("update a person")
// todo

print("delete a person")
// todo