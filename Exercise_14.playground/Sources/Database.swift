import Foundation

// the class that can hold any data type but the element must be equatable and hashable
public class Database<Element> where Element: Equatable, Element: Hashable {
    
    public var items: Set<Element>
    
    public init() {
        
        items = Set<Element>()
    }
}

extension Database: Container {
    
    public typealias ItemType = Element
    
    public func addItem(item: ItemType) {
        
        items.insert(item)
    }
    
    public func removeItem(item: ItemType) -> ItemType? {
        
        let index = items.index { $0 == item }
        
        if index != nil {
            
            return items.remove(at: index!)
        }
        
        return nil
    }
    
    public var count: Int {

        return items.count
    }
    
    public subscript(i: Int) -> ItemType {

        return items[items.index(items.startIndex, offsetBy: i)]
    }
}

extension Database {

    public func deserialize<T>(filename: String, closure: (AnyObject) -> T) {

        var contents: String?
        do {
            contents = try FileUtils.getFileContents(filename: filename)
        } catch FileError.ReadError(let error) {
            print(error)
        } catch FileError.NotFound(let path) {
            print(path)
        } catch let error as NSError {
            print(error)
        }

        if let payload = contents {
            let jsonData = payload.data(using: String.Encoding.utf8)!
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)

                if let arrayOfDictionaries = jsonObject as? [[String:AnyObject]] {

                    for dictionary in arrayOfDictionaries {

                        addItem(item: closure(dictionary as AnyObject) as! ItemType)
                    }
                } else if let array = jsonObject as? [AnyObject] {
                    
                    for thing in array {
                        
                        addItem(item: closure(thing) as! ItemType)
                    }
                } else {
                    print("not a array")
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    public func serialize(caster: (Set<Element>) -> Any) -> String? {
        do {
            // the closure parameter needs to cast the Set<Element> to an appropriate AnyObject for NSJSONSerialization, either an Array or Dictionary

            let jsonData = try JSONSerialization.data(withJSONObject: caster(items), options: .prettyPrinted)

            return String(data: jsonData, encoding: String.Encoding.utf8)

        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return nil
    }
}
