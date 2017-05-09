import Foundation

public class PersonHttpService: PersonService {
    
    let url: URL
    let session: URLSession
    
    public init(url: URL) {
        self.url = url
        session = URLSession.shared
    }
    
    public func getPersons(completion: @escaping (HandlerPersons) -> Void) throws {
        
        var request = URLRequest(url: URL(string: "\(url)/persons")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        session.dataTask(with: request) {(data, response, error) in
            
            completion() {
                
                let statusCode = (response as? HTTPURLResponse)?.statusCode
                guard statusCode! >= 200 && statusCode! < 300, let safeData = data else {
                    
                    if (data != nil) {
                        let error = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                        
                        let responseError = ResponseErrors()
                        
                        if let jsonError = error as? [String : AnyObject] {
                            
                            if let jsonErrors = jsonError["errors"] as? [[String: String]] {
                                
                                for errorDictionary in jsonErrors {
                                    
                                    let error = ResponseError(message: errorDictionary["message"]!)
                                    
                                    responseError.errors.append(error)
                                }
                            }
                        }
                        
                        throw PersonApiError.ResponseError(errors: responseError)
                    }
                    
                    throw PersonApiError.Unknown(message: "don't know")
                }
                
                var persons = [Person]()
                
                let json = try JSONSerialization.jsonObject(with: safeData, options: .mutableContainers)
                
                if let jsonPersons = json as? [[String : AnyObject]] {
                    
                    for personDictionary in jsonPersons {
                        
                        persons.append(Person(dictionary: personDictionary))
                    }
                }
                
                return persons
            }
        }.resume()
    }

}
