import Foundation

// the class that can hold any data type but the element must be equatable
public class Database<Element where Element: Equatable, Element: Hashable> {
    
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
        let index = items.indexOf { $0 == item }
        if index != nil {
            return items.removeAtIndex(index!)
        }
        return nil
    }
    
    public var count: Int {
        return items.count
    }
    
    public subscript(i: Int) -> ItemType {
        return items[items.startIndex.advancedBy(i)]
    }
}

extension Database {
    
    public func deserialize<T>(filename: String, closure: (item: AnyObject) -> T) {
        
        var contents: String?
        do {
            contents = try FileUtils.getFileContents(filename)
        } catch FileError.ReadError(let error) {
            print(error)
        } catch FileError.NotFound(let path) {
            print(path)
        } catch let error as NSError {
            print(error)
        }
        
        if let payload = contents {
            let jsonData = payload.dataUsingEncoding(NSUTF8StringEncoding)!
            do {
                if let jsonObject: AnyObject = try NSJSONSerialization.JSONObjectWithData(jsonData, options: .MutableContainers) {
                    
                    if let arrayOfDictionaries = jsonObject as? [[String:AnyObject]] {
                        for dictionary in arrayOfDictionaries {

                            let item = closure(item: dictionary) as! ItemType
                            
                            addItem(item)
                        }
                    } else if let array = jsonObject as? [AnyObject] {
                        for thing in array {
                            
                            let item = closure(item: thing) as! ItemType
                            
                            addItem(item)
                        }
                    } else {
                        print("not a array of dictionaries")
                    }
                } else {
                    print("could not deserialize")
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    public func serialize(convert: (items: Set<Element>) -> AnyObject) -> String? {
        do {
            let anyObject = convert(items: items)

            let jsonData = try NSJSONSerialization.dataWithJSONObject(anyObject, options: .PrettyPrinted)
            
            return String(data: jsonData, encoding: NSUTF8StringEncoding)
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return nil
    }
}
