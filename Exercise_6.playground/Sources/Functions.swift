import Foundation

public typealias Student = [String:String]

func iterator(students: [Student], closure: (_ student: Student) -> Void) {

    for index in 0..<students.count {

        closure(students[index])
    }
}

// Iterate over each element in the array
public func each(students: [Student], closure: (_ student: Student, _ index: Int) -> Void) {

    var index = 0

    iterator(students: students) {

        closure($0, index)

        index += 1
    }
}

// Returns true if all of the elements is not false
public func all(students: [Student], closure: (_ student: Student) -> Bool) -> Bool {
    
    var all = true
    
    iterator(students: students) { (student) -> Void in

        if all && !closure(student) {
            
            all = false
        }
    }

    return all
}

// Returns true if at least one of the elements is not false
public func any(students: [Student], closure: (_ student: Student) -> Bool) -> Bool {

    var any = false
    
    iterator(students: students) { (student) -> Void in
        
        if !any && closure(student) {
            
            any = true
        }
    }
    
    return any
}

// Returns the index at which element can be found
public func indexOf(students: [Student], closure: (_ student: Student) -> Bool) -> Int? {

    var index = -1
    var found = false

    iterator(students: students) { (student) -> Void in

        if !found {
            
            if closure(student)  {
                found = true
            }

            index += 1
        }
    }

    return index == -1 || !found ? nil : index
}

// Returns true if the element is present
public func contains(students: [Student], closure: (_ student: Student) -> Bool) -> Bool {
    
    var found = false
    
    iterator(students: students) { (student) -> Void in
        
        if !found && closure(student) {

            found = true
        }
    }
    
    return found
}

// Returns an array of all the elements that pass a truth test
public func filter(students: [Student], closure: (_ student: Student) -> Bool) -> [Student]? {
    
    var filter = [Student]()

    iterator(students: students) { (student) -> Void in
        
        if closure(student) {
            
            filter.append(student)
        }
    }

    return !filter.isEmpty ? filter : nil
}

// Returns the elements in the array without the elements that pass a truth test
public func reject(students: [Student], closure: (_ student: Student) -> Bool) -> [Student]? {

    var keep = [Student]()

    iterator(students: students) { (student) -> Void in

        if !closure(student) {

            keep.append(student)
        }
    }

    return !keep.isEmpty ? keep : nil
}

// Returns an array of a specific value from all the elements
public func pluck(students: [Student], closure: (_ student: Student) -> String) -> [String] {

    var plucked = [String]()

    iterator(students: students) { plucked.append(closure($0)) }

    return plucked
}
