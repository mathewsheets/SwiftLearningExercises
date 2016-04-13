/*:
[Exercises](Exercises) | [Previous](@previous)
 * callout(Exercise): You have to record all the students for your school. Leveraging arrays, dictionaries, and sets, create table like containers for each class. Your classes are Math, Science, English and History with a total of 17 unique students with 7 students in each class. Print out each class roster and experiment with set operations, membership and equality.
 
 **Example Output:**
 - `Math = Mathew Sheets, John Winters, Sam Smith`
 - `Science = Sam Smith, Carson Daily, Adam Aarons`
 - `Union of Math and Science = Mathew Sheets, John Winters, Sam Smith, Carson Daily, Adam Aarons`
 
 **Constraints:**
 - Use Set Operations
     - intersect
     - exclusiveOr
     - union
     - subtract
 - Use Set Membership and Equality
     - is equal
     - isSubsetOf
     - isSupersetOf
     - isStrictSubsetOf
     - isStrictSupersetOf
     - isDisjointWith
 */
var students = getStudents()

var allStudents = getEntireClass(&students)
var math        = getMathStudents(students)
var mathBoys    = getMathBoyStudents(students)
var mathGirls   = getMathGirlStudents(students)
var science     = getScienceStudents(students)
var english     = getEnglishStudents(students)
var history     = getHistoryStudents(students)
var classes     = getSemester([math, science, english, history])

print("All \(students.count) students")
for student in students {
    print("\t\(student["name"]!)")
}

let classNames = classes.keys
for name in classNames {
    
    let _class = classes[name]!
    
    print("\(_class.count) \(name) Students")
    
    for student in _class {
        print("\t\(student)")
    }
}

let mathAndScienceIntersect = math.intersect(science)
print("\(mathAndScienceIntersect.count) Intersecting Math & Science Students")
for student in mathAndScienceIntersect {
    print("\t\(student)")
}
let mathAndScienseExclusiveOr = math.exclusiveOr(science)
print("\(mathAndScienseExclusiveOr.count) ExclusiveOr of Math & Science Students")
for student in mathAndScienseExclusiveOr {
    print("\t\(student)")
}
let mathAndScienceUnion = math.union(science)
print("\(mathAndScienceUnion.count) Union of Math & Science Students")
for student in mathAndScienceUnion {
    print("\t\(student)")
}
let mathAndScienceSubtract = math.subtract(science)
print("\(mathAndScienceSubtract.count) Subtracting Math & Science Students")
for student in mathAndScienceSubtract {
    print("\t\(student)")
}

if allStudents == math.union(science).union(english).union(history) {
    print("Unioning all classes equals all the students")
}
if english.isSubsetOf(allStudents) {
    print("English is a subset of all students")
}
if !english.isSubsetOf(history) {
    print("English is not a subset of History")
}
if allStudents.isSupersetOf(history) {
    print("All students is a superset of History")
}

if mathGirls.isStrictSubsetOf(math) {
    print("Math girls is a strict subset of math")
}
if !mathGirls.union(mathBoys).isStrictSubsetOf(math) {
    print("Math girls & boys is not a strict subset of math")
}

if !allStudents.isStrictSupersetOf(math.union(science).union(english).union(history)) {
    print("All classes is not a strict superset of all students")
}
let stemStudents = math.union(science)
if allStudents.isStrictSupersetOf(stemStudents) {
    print("All students is a strict superset of STEM students")
}

if mathBoys.isDisjointWith(mathGirls) {
    print("Math boys is disjointed w/ math girls")
}
if !mathGirls.isDisjointWith(math) {
    print("Math girls is not disjointed w/ math")
}
/*:
[Exercises](Exercises) | [Previous](@previous)
*/
