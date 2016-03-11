import Foundation

public typealias Student = [String:String]

func iterator(students: [Student], closure: (student: Student) -> Void) {
    
    for var index = 0; index < students.count; ++index {
        
        closure(student: students[index])
    }
}

// Iterate over each element in the array
public func each(students: [Student], closure: (student: Student, index: Int) -> Void) {
    
    var index = 0;
    
    iterator(students) { closure(student: $0, index: index++) }
}

// Returns true if all of the elements is not false
public func all(students: [Student], closure: (student: Student) -> Bool) -> Bool {
    
    var all = true
    
    iterator(students) { (student) -> Void in

        if all && !closure(student: student) {
            
            all = false
        }
    }

    return all
}

// Returns true if at least one of the elements is not false
public func any(students: [Student], closure: (student: Student) -> Bool) -> Bool {

    var any = false
    
    iterator(students) { (student) -> Void in
        
        if !any && closure(student: student) {
            
            any = true
        }
    }
    
    return any
}

// Returns the index at which element can be found
public func indexOf(students: [Student], closure: (student: Student) -> Bool) -> Int? {

    var index = -1
    var found = false

    iterator(students) { (student) -> Void in

        if !found {
            
            if closure(student: student)  {
                found = true
            }

            index++
        }
    }

    return index == -1 || !found ? nil : index
}

// Returns true if the element is present
public func contains(students: [Student], closure: (student: Student) -> Bool) -> Bool {
    
    var found = false
    
    iterator(students) { (student) -> Void in
        
        if !found && closure(student: student) {

            found = true
        }
    }
    
    return found
}

// Returns an array of all the elements that pass a truth test
public func filter(students: [Student], closure: (student: Student) -> Bool) -> [Student]? {
    
    var filter = [Student]()

    iterator(students) { (student) -> Void in
        
        if closure(student: student) {
            
            filter.append(student)
        }
    }

    return !filter.isEmpty ? filter : nil
}

// Returns the elements in the array without the elements that pass a truth test
public func reject(students: [Student], closure: (student: Student) -> Bool) -> [Student]? {

    var keep = [Student]()

    iterator(students) { (student) -> Void in

        if !closure(student: student) {

            keep.append(student)
        }
    }

    return !keep.isEmpty ? keep : nil
}

// Returns an array of a specific value from all the elements
public func pluck(students: [Student], closure: (student: Student) -> String) -> [String] {

    var plucked = [String]()

    iterator(students) { plucked.append(closure(student: $0)) }

    return plucked
}
