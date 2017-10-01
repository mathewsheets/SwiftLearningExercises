import Foundation

// the contract for the Container
public protocol Container {

    associatedtype ItemType

    func add(item: ItemType)

    func remove(item: ItemType) -> ItemType?

    var count: Int { get }

    subscript(i: Int) -> ItemType { get }
}

// the class that can hold any data type but the element must be equatable
public class Database<Element> where Element: Hashable {

    public var items: [Element]
    
    public init() {

        items = [Element]()
    }
}

extension Database: Container {
    
    public typealias ItemType = Element

    public func add(item: ItemType) {
        
        items.append(item)
    }
    
    public func remove(item: ItemType) -> ItemType? {
        
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
        
        return items[i]
    }
}

public class DataFinder {

    public init() {
        
    }
    
    func iterator<T>(items: [T], closure: (T) -> Void) {

        for index in 0..<items.count {

            closure(items[index])
        }
    }

    public func each<T>(items: [T], closure: (T, Int) -> Void) {

        var index = 0;
        
        iterator(items: items) { (item) in
            
            closure(item, index)
            
            index += 1
        }
    }

    public func all<T>(items: [T], closure: (T) -> Bool) -> Bool {
    
        var all = true
        
        iterator(items: items) { (item) -> Void in
        
            if all && !closure(item) {
                
                all = false
            }
        }
        
        return all
    }
    
    public func any<T>(items: [T], closure: (T) -> Bool) -> Bool {
        
        var any = false
        
        iterator(items: items) { (item) -> Void in
            
            if !any && closure(item) {
                
                any = true
            }
        }
        
        return any
    }
    
    public func indexOf<T>(items: [T], closure: (T) -> Bool) -> Int? {
        
        var index = -1
        var found = false
        
        iterator(items: items) { (item) -> Void in
            
            if !found {
                
                if closure(item)  {
                    found = true
                }
                
                index += 1
            }
        }
        
        return index == -1 || !found ? nil : index
    }
    
    public func contains<T>(items: [T], closure: (T) -> Bool) -> Bool {
        
        var found = false
        
        iterator(items: items) { (item) -> Void in
            
            if !found && closure(item) {
                
                found = true
            }
        }
        
        return found
    }
    
    public func filter<T>(items: [T], closure: (T) -> Bool) -> [T]? {
        
        var filter = [T]()
        
        iterator(items: items) { (item) -> Void in
            
            if closure(item) {
                
                filter.append(item)
            }
        }
        
        return !filter.isEmpty ? filter : nil
    }
    
    public func reject<T>(items: [T], closure: (T) -> Bool) -> [T]? {
        
        var keep = [T]()
        
        iterator(items: items) { (item) -> Void in
            
            if !closure(item) {
                
                keep.append(item)
            }
        }
        
        return !keep.isEmpty ? keep : nil
    }
    
    public func pluck<T>(items: [T], closure: (T) -> Any) -> [Any] {
        
        var plucked = [Any]()
        
        iterator(items: items) { plucked.append(closure($0)) }
        
        return plucked
    }
}
