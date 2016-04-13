/*:
[Exercises](Exercises) | [Previous](@previous) | [Next](@next)
 * callout(Exercise): Get Acquainted. Get a few properties of each student in your class... name and email are good. Use the `String` and `Character` as well as the data types and operators in [Basics | Data Types | Operators](Basics%20|%20Data%20Types%20|%20Operators) to complete this exercise.
 
 **Example Output:**
 - `My name is Mathew Sheets, my email is swift.dude@gmail.com.`
 - `Other students in my class are Annie, Sam, Jack, Hudson and Oliver.`
 - `Oliver dropped this class.` (**use the second bullet point string to pull out the last students's name.**)
 - `Other students in my class are Annie, Sam, Jack, Hudson and CARSON was added.`  (**use the second bullet point string and append another student.**)
 - `Jack and Hudson are in the class.` (**use the second bullet point string to pull out third and fourth student.**)
 
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
var otherStudents = getStudents(getStudentNames(Mirror(reflecting: students)))

let firstStudent = students.0
let lastStudent = findLastStudent(students.5, sentence: otherStudents)
let newOtherStudents = dropLastStudent(students.5, sentence: otherStudents)
let thirdStudent =  findStudent(students.3, sentence: otherStudents)
let fourthStudent = findStudent(students.4, sentence: otherStudents)

print("My name is \(firstStudent.first) \(firstStudent.last), my email is \(firstStudent.email).")
print(otherStudents)
print("\(lastStudent) dropped this class.")
print("\(newOtherStudents)and \(newStudent.first.uppercaseString) was added.")
print("\(thirdStudent) and \(fourthStudent) are in the class.")
/*:
[Exercises](Exercises) | [Previous](@previous) | [Next](@next)
*/
