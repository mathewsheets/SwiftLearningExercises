import Foundation

func iterator(students: [[String:String]], closure: (student: [String:String]) -> Void) {
    
    for var index = 0; index < students.count; ++index {
        
        closure(student: students[index])
    }
}

// Iterate over each element in the array
public func each(students: [[String:String]], closure: (student: [String:String], index: Int) -> Void) {
    
    var index = 0;
    
    iterator(students) { closure(student: $0, index: index++) }
}

// Returns true if all of the element is not false
public func all(students: [[String:String]], closure: (student: [String:String]) -> Bool) -> Bool {
    
    return false
}

// Returns true if at least one of the elements is not false
public func any(students: [[String:String]], closure: (student: [String:String]) -> Bool) -> Bool {

    return false
}

// Returns the index at which element can be found
public func indexOf(students: [[String:String]], closure: (student: [String:String]) -> Bool) -> Int? {
    
    return nil
}

// Returns true if the element is present in the list
public func contains() -> Bool {
    
    return false
}

// Returns an array of all the elements that pass a truth test (predicate).
public func filter() -> [String:String]? {
    
    return nil
}

// Returns the elements in the array without the elements that pass a truth test (predicate).
public func reject() -> [String:String]? {
    
    return nil
}

// Returns an array of a specific value from all the elements
public func pluck(students: [[String:String]], closure: (student: [String:String]) -> String) -> [String] {
    
    var plucked = [String]()
    
    iterator(students) { (student) -> Void in
        
        let value = closure(student: student)
        
        plucked.append(value)
        
    }
    
    return plucked
}
