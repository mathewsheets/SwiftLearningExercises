/*:
[Exercises](Exercises) | [Previous](@previous)
 * callout(Exercise): You have to record all the students for your school. Leveraging arrays, dictionaries, and sets, create table like containers for each class. Your classes are Math, Science, English and History with a total of 17 unique students with 7 students in each class. Print out each class roster and experiment with set operations, membership and equality.
 
 **Example Output:**
 - `Math = Obi-Wan Kenobi, Padme Amidala, Han Solo, Count Dooku, Boba Fett, Luke Skywalker, Kylo Ren`
 - `Science = Chew Bacca, Padme Amidala, Poe Dameron, Count Dooku, Lando Calrissian, Darth Vader, Luke Skywalker`
 - `Union of Math and Science = Darth Vader, Chew Bacca, Obi-Wan Kenobi, Padme Amidala, Poe Dameron, Han Solo, Count Dooku, Lando Calrissian, Boba Fett, Luke Skywalker, Kylo Ren`

 **Constraints:**
 - Use Set Operations
     - intersection(_:)
     - symmetricDifference(_:)
     - union(_:)
     - subtracting(_:)
 - Use Set Membership and Equality
     - is equal
     - isSubset(of:)
     - isSuperset(of:)
     - isStrictSubset(of:)
     - isStrictSuperset(of:)
     - isDisjoint(with:)
 */
var students = getStudents()

var allStudents = getEntireClass(students: &students)
var math        = getMathStudents(students: students)
var mathBoys    = getMathBoyStudents(students: students)
var mathGirls   = getMathGirlStudents(students: students)
var science     = getScienceStudents(students: students)
var english     = getEnglishStudents(students: students)
var history     = getHistoryStudents(students: students)
var classes     = getSemester(classes: [math, science, english, history])

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

let mathAndScienceIntersect = math.intersection(science)
print("\(mathAndScienceIntersect.count) Intersecting Math & Science Students")
for student in mathAndScienceIntersect {
    print("\t\(student)")
}
let mathAndScienseExclusiveOr = math.symmetricDifference(science)
print("\(mathAndScienseExclusiveOr.count) ExclusiveOr of Math & Science Students")
for student in mathAndScienseExclusiveOr {
    print("\t\(student)")
}
let mathAndScienceUnion = math.union(science)
print("\(mathAndScienceUnion.count) Union of Math & Science Students")
for student in mathAndScienceUnion {
    print("\t\(student)")
}
let mathAndScienceSubtract = math.subtracting(science)
print("\(mathAndScienceSubtract.count) Subtracting Math & Science Students")
for student in mathAndScienceSubtract {
    print("\t\(student)")
}

if allStudents == math.union(science).union(english).union(history) {
    print("Unioning all classes equals all the students")
}
if english.isSubset(of: allStudents) {
    print("English is a subset of all students")
}
if !english.isSubset(of: history) {
    print("English is not a subset of History")
}
if allStudents.isSuperset(of: history) {
    print("All students is a superset of History")
}

if mathGirls.isStrictSubset(of: math) {
    print("Math girls is a strict subset of math")
}
if !mathGirls.union(mathBoys).isStrictSubset(of: math) {
    print("Math girls & boys is not a strict subset of math")
}

if !allStudents.isStrictSuperset(of: math.union(science).union(english).union(history)) {
    print("All classes is not a strict superset of all students")
}
let stemStudents = math.union(science)
if allStudents.isStrictSuperset(of: stemStudents) {
    print("All students is a strict superset of STEM students")
}

if mathBoys.isDisjoint(with: mathGirls) {
    print("Math boys is disjointed w/ math girls")
}
if !mathGirls.isDisjoint(with: math) {
    print("Math girls is not disjointed w/ math")
}
/*:
[Exercises](Exercises) | [Previous](@previous)
*/
