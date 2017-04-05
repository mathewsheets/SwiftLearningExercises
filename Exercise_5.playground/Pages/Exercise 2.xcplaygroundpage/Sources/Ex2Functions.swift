import Foundation

public func getStudentNames(mirror: Mirror) -> [String] {
    
    var names = [String]()

    for case let (_?, student) in mirror.children {
        let studentMirror = Mirror(reflecting: student)
        for case let (label?, value) in studentMirror.children {
            if label == "first" { // this is the title
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
    let studentRange = sentence.range(of: studentToFind)!

    return sentence.substring(with: studentRange)
}

public func findLastStudent(student: (String, String, String), sentence: String) -> String {

    let studentToFind = " and \(student.0)"
    let studentRange = sentence.range(of: studentToFind)!
    let studentStrTmp = sentence.substring(with: studentRange)

    return studentStrTmp.substring(from: studentStrTmp.index(studentStrTmp.startIndex, offsetBy: 5))
}

public func dropLastStudent(dropping: (String, String, String), sentence: String) -> String {

    let dropString = " and \(dropping.0)"

    return sentence.substring(to: sentence.index(sentence.endIndex, offsetBy: -dropString.characters.count))
}

public func getDate(year: Int, month: Int, day: Int) -> String {

    var dateComponets = DateComponents()
    dateComponets.year = year
    dateComponets.month = month
    dateComponets.day = day

    if let date = Calendar.current.date(from: dateComponets) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        return dateFormatter.string(from: date)
    }
    
    return "INVALID";
}
