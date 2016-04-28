import Foundation

// the contract for the Container
public protocol Container {

    associatedtype ItemType

    func addItem(item: ItemType)

    func removeItem(item: ItemType) -> ItemType?

    var count: Int { get }

    subscript(i: Int) -> ItemType { get }
}

// the class that can hold any data type but the element must be equatable
public class Database<Element where Element: Equatable, Element: Hashable> {

    public var items: [Element]
    
    public init() {

        items = [Element]()
    }
}

extension Database: Container {
    
    public typealias ItemType = Element

    public func addItem(item: ItemType) {
        items.append(item)
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
        return items[i]
    }
}

public class DataFinder {

    public init() {
        
    }
    
    func iterator<T>(items: [T], closure: (item: T) -> Void) {

        for index in 0..<items.count {

            closure(item: items[index])
        }
    }

    public func each<T>(items: [T], closure: (item: T, index: Int) -> Void) {

        var index = 0;
        
        iterator(items) { (item) in
            
            closure(item: item, index: index)
            
            index += 1
        }
    }

    public func all<T>(items: [T], closure: (item: T) -> Bool) -> Bool {
    
        var all = true
        
        iterator(items) { (item) -> Void in
        
            if all && !closure(item: item) {
                
                all = false
            }
        }
        
        return all
    }
    
    public func any<T>(items: [T], closure: (item: T) -> Bool) -> Bool {
        
        var any = false
        
        iterator(items) { (item) -> Void in
            
            if !any && closure(item: item) {
                
                any = true
            }
        }
        
        return any
    }
    
    public func indexOf<T>(items: [T], closure: (item: T) -> Bool) -> Int? {
        
        var index = -1
        var found = false
        
        iterator(items) { (item) -> Void in
            
            if !found {
                
                if closure(item: item)  {
                    found = true
                }
                
                index += 1
            }
        }
        
        return index == -1 || !found ? nil : index
    }
    
    public func contains<T>(items: [T], closure: (item: T) -> Bool) -> Bool {
        
        var found = false
        
        iterator(items) { (item) -> Void in
            
            if !found && closure(item: item) {
                
                found = true
            }
        }
        
        return found
    }
    
    public func filter<T>(items: [T], closure: (item: T) -> Bool) -> [T]? {
        
        var filter = [T]()
        
        iterator(items) { (item) -> Void in
            
            if closure(item: item) {
                
                filter.append(item)
            }
        }
        
        return !filter.isEmpty ? filter : nil
    }
    
    public func reject<T>(items: [T], closure: (item: T) -> Bool) -> [T]? {
        
        var keep = [T]()
        
        iterator(items) { (item) -> Void in
            
            if !closure(item: item) {
                
                keep.append(item)
            }
        }
        
        return !keep.isEmpty ? keep : nil
    }
    
    public func pluck<T>(items: [T], closure: (item: T) -> AnyObject) -> [AnyObject] {
        
        var plucked = [AnyObject]()
        
        iterator(items) { plucked.append(closure(item: $0)) }
        
        return plucked
    }
}
