import Foundation

public func getStudentNames(mirror: Mirror) -> [String] {
    
    var names = [String]()

    for case let (_?, student) in mirror.children {
        let studentMirror = Mirror(reflecting: student)
        for case let (label?, value) in studentMirror.children {
            if label == ".0" { // this is the title
                names.append("\(value)")
            }
        }
    }
    
    return names
}

public func getStudents(students: [String]) -> String {
    
    return "Other students in my class are \(students[1]), \(students[2]), \(students[3]), \(students[4]) and \(students[5])."
}

public func findStudent(student: (String, String, String), sentence: String) -> String {
    
    let studentToFind = student.0
    let studentRange = sentence.rangeOfString(studentToFind)!
    let studentStr = sentence.substringWithRange(studentRange)

    return studentStr
}

public func findLastStudent(student: (String, String, String), sentence: String) -> String {

    let studentToFind = " and \(student.0)"
    let studentRange = sentence.rangeOfString(studentToFind)!
    let studentStrTmp = sentence.substringWithRange(studentRange)
    
    let studentStr = studentStrTmp.substringFromIndex(studentStrTmp.startIndex.advancedBy(5))
    
    return studentStr
}

public func dropLastStudent(dropping: (String, String, String), sentence: String) -> String {

    let dropString = " and \(dropping.0)"

    return sentence.substringToIndex(sentence.endIndex.advancedBy(-dropString.characters.count))
}
