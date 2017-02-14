/*:
[Exercises](Exercises) | [Previous](@previous) | [Next](@next)
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
var otherStudents = getStudents(students: getStudentNames(mirror: Mirror(reflecting: students)))

let firstStudent = students.0
let lastStudent = findLastStudent(student: students.5, sentence: otherStudents)
let newOtherStudents = dropLastStudent(dropping: students.5, sentence: otherStudents)
let thirdStudent =  findStudent(student: students.3, sentence: otherStudents)
let fourthStudent = findStudent(student: students.4, sentence: otherStudents)

print("My name is \(firstStudent.first) \(firstStudent.last), my email is \(firstStudent.email).")
print(otherStudents)
print("\(lastStudent) dropped this class.")
print("\(newOtherStudents)and \(newStudent.first.uppercased()) was added.")
print("\(thirdStudent) and \(fourthStudent) are in the class.")

var classDates = ""

let dates = (
    (
        year: 2017,
        month: (
            jan: (number: 1, dates: (date: 18, date: 25)),
            feb: (number: 2, dates: (date: 1, date: 8, date: 15, date: 22)),
            mar: (number: 3, dates: (date: 1, date: 8, date: 15, date: 22, date: 29)),
            apr: (number: 4, dates: (date: 5, date: 12, date: 19, date: 26)),
            may: (number: 5, dates: (date: 3))
        )
    )
)

classDates += getDate(year: dates.year, month: dates.month.jan.number, day: dates.month.jan.dates.0)
classDates += ", "
classDates += getDate(year: dates.year, month: dates.month.jan.number, day: dates.month.jan.dates.1)
classDates += ", "
classDates += getDate(year: dates.year, month: dates.month.feb.number, day: dates.month.feb.dates.0)
classDates += ", "
classDates += getDate(year: dates.year, month: dates.month.feb.number, day: dates.month.feb.dates.1)
classDates += ", "
classDates += getDate(year: dates.year, month: dates.month.feb.number, day: dates.month.feb.dates.2)
classDates += ", "
classDates += getDate(year: dates.year, month: dates.month.feb.number, day: dates.month.feb.dates.3)
classDates += ", "
classDates += getDate(year: dates.year, month: dates.month.mar.number, day: dates.month.mar.dates.0)
classDates += ", "
classDates += getDate(year: dates.year, month: dates.month.mar.number, day: dates.month.mar.dates.1)
classDates += ", "
classDates += getDate(year: dates.year, month: dates.month.mar.number, day: dates.month.mar.dates.2)
classDates += ", "
classDates += getDate(year: dates.year, month: dates.month.mar.number, day: dates.month.mar.dates.3)
classDates += ", "
classDates += getDate(year: dates.year, month: dates.month.mar.number, day: dates.month.mar.dates.4)
classDates += ", "
classDates += getDate(year: dates.year, month: dates.month.apr.number, day: dates.month.apr.dates.0)
classDates += ", "
classDates += getDate(year: dates.year, month: dates.month.apr.number, day: dates.month.apr.dates.1)
classDates += ", "
classDates += getDate(year: dates.year, month: dates.month.apr.number, day: dates.month.apr.dates.2)
classDates += ", "
classDates += getDate(year: dates.year, month: dates.month.apr.number, day: dates.month.apr.dates.3)
classDates += ", "
classDates += getDate(year: dates.year, month: dates.month.may.number, day: dates.month.may.dates.0)

print("My Swift class in on \(classDates)")
/*:
[Exercises](Exercises) | [Previous](@previous) | [Next](@next)
*/
