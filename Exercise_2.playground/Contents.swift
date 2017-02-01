/*:
 * callout(Exercise): Get Acquainted. Get a few properties of each student in your class... name and email are good. Use the `String` and `Character` as well as the data types and operators in [Basics | Data Types | Operators](Basics%20|%20Data%20Types%20|%20Operators) to complete this exercise.
 
 **Example Output:**
 - `My name is Mathew Sheets, my email is swift.dude@gmail.com.`
 - `Other students in my class are Annie, Sam, Jack, Hudson and Oliver.`
 - `Oliver dropped this class.` (**use the second bullet point string to pull out the last students's name.**)
 - `Other students in my class are Annie, Sam, Jack, Hudson and CARSON was added.`  (**use the second bullet point string and append another student.**)
 - `Jack and Hudson are in the class.` (**use the second bullet point string to pull out third and fourth student.**)
 - `My Swift class in on  Jan 18 2017, Jan 25 2017 ` (**LIST OUT THE REST OF THE DATES**)
 
 **Constraints:**
 - Use a nested tuple to hold your students
 - Use the string created from the second bullet point for all other string creation
 */
import Foundation

let students = (
    (first: "Mathew", last: "Sheets", email: "swift.dude@gmail.com"),
    (first: "Annie", last: "Sheets", email: "annie.sheets@email.com"),
    (first: "Sam", last: "Sheets", email: "sam.sheets@email.com"),
    (first: "Jack", last: "Sheets", email: "jack.sheets@email.com"),
    (first: "Hudson", last: "Sheets", email: "hudson.sheets@email.com"),
    (first: "Oliver", last: "Sheets", email: "oliver.sheets@email.com")
)
let newStudent = (first: "Carson", last: "Sheets", email: "carson.sheets@email.com")

var otherStudents = "Other students in my class are \(students.1.first), \(students.2.first), \(students.3.first), \(students.4.first) and \(students.5.first)."

let firstStudent = students.0

let lastStudent = students.5
let lastStudentToFind = " and \(lastStudent.first)"
let lastStudentRange = otherStudents.range(of: lastStudentToFind)!
let lastStudentStrTmp = otherStudents.substring(with: lastStudentRange)

let lastStudentStr = lastStudentStrTmp.substring(from: lastStudentStrTmp.index(lastStudentStrTmp.startIndex, offsetBy: 5))
let newOtherStudents = otherStudents.substring(to: otherStudents.index(otherStudents.endIndex, offsetBy: -lastStudentToFind.characters.count))

let thirdStudent = students.3
let thirdStudentToFind = thirdStudent.first
let thirdStudentRange = otherStudents.range(of: thirdStudentToFind)!
let thirdStudentStr = otherStudents.substring(with: thirdStudentRange)

let fourthStudent = students.4
let fourthStudentToFind = fourthStudent.first
let fourthStudentRange = otherStudents.range(of: fourthStudentToFind)!
let fourthStudentStr = otherStudents.substring(with: fourthStudentRange)

var classDates = ""

let dates = (
    (
        year: 2017, month: (
            jan: (date: 18, date: 25),
            feb: (date: 1, date: 8, date: 15, date: 22),
            mar: (date: 1, date: 8, date: 15, date: 22, date: 29),
            apr: (date: 5, date: 12, date: 19, date: 26),
            may: (date: 3)
        )
    )
)

var dateComponets = DateComponents()
dateComponets.year = dates.year

// start of jan
dateComponets.month = 1
dateComponets.day = dates.month.jan.0
if let date = Calendar.current.date(from: dateComponets) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = DateFormatter.Style.medium
    classDates += dateFormatter.string(from: date)
}
classDates += ", "
dateComponets.day = dates.month.jan.1
if let date = Calendar.current.date(from: dateComponets) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = DateFormatter.Style.medium
    classDates += dateFormatter.string(from: date)
}

// start of feb
dateComponets.month = 2
classDates += ", "
dateComponets.day = dates.month.feb.0
if let date = Calendar.current.date(from: dateComponets) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = DateFormatter.Style.medium
    classDates += dateFormatter.string(from: date)
}
classDates += ", "
dateComponets.day = dates.month.feb.1
if let date = Calendar.current.date(from: dateComponets) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = DateFormatter.Style.medium
    classDates += dateFormatter.string(from: date)
}
classDates += ", "
dateComponets.day = dates.month.feb.2
if let date = Calendar.current.date(from: dateComponets) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = DateFormatter.Style.medium
    classDates += dateFormatter.string(from: date)
}
classDates += ", "
dateComponets.day = dates.month.feb.3
if let date = Calendar.current.date(from: dateComponets) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = DateFormatter.Style.medium
    classDates += dateFormatter.string(from: date)
}

// start of march
dateComponets.month = 3
classDates += ", "
dateComponets.day = dates.month.mar.0
if let date = Calendar.current.date(from: dateComponets) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = DateFormatter.Style.medium
    classDates += dateFormatter.string(from: date)
}
classDates += ", "
dateComponets.day = dates.month.mar.1
if let date = Calendar.current.date(from: dateComponets) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = DateFormatter.Style.medium
    classDates += dateFormatter.string(from: date)
}
classDates += ", "
dateComponets.day = dates.month.mar.2
if let date = Calendar.current.date(from: dateComponets) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = DateFormatter.Style.medium
    classDates += dateFormatter.string(from: date)
}
classDates += ", "
dateComponets.day = dates.month.mar.3
if let date = Calendar.current.date(from: dateComponets) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = DateFormatter.Style.medium
    classDates += dateFormatter.string(from: date)
}
classDates += ", "
dateComponets.day = dates.month.mar.4
if let date = Calendar.current.date(from: dateComponets) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = DateFormatter.Style.medium
    classDates += dateFormatter.string(from: date)
}

// start of apr
dateComponets.month = 4
classDates += ", "
dateComponets.day = dates.month.apr.0
if let date = Calendar.current.date(from: dateComponets) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = DateFormatter.Style.medium
    classDates += dateFormatter.string(from: date)
}
classDates += ", "
dateComponets.day = dates.month.apr.1
if let date = Calendar.current.date(from: dateComponets) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = DateFormatter.Style.medium
    classDates += dateFormatter.string(from: date)
}
classDates += ", "
dateComponets.day = dates.month.apr.2
if let date = Calendar.current.date(from: dateComponets) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = DateFormatter.Style.medium
    classDates += dateFormatter.string(from: date)
}
classDates += ", "
dateComponets.day = dates.month.apr.3
if let date = Calendar.current.date(from: dateComponets) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = DateFormatter.Style.medium
    classDates += dateFormatter.string(from: date)
}

// start of may
dateComponets.month = 5
classDates += ", "
dateComponets.day = dates.month.may.0
if let date = Calendar.current.date(from: dateComponets) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = DateFormatter.Style.medium
    classDates += dateFormatter.string(from: date)
}

print("My name is \(firstStudent.first) \(firstStudent.last), my email is \(firstStudent.email).")
print(otherStudents)
print("\(lastStudentStr) dropped this class.")
print("\(newOtherStudents)and \(newStudent.first.uppercased()) was added.")
print("\(thirdStudentStr) and \(fourthStudentStr) are in the class.")
print("My Swift class in on \(classDates)")