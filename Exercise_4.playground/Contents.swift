/*:
**Exercise:** You have to record all the students for your school. Leveraging arrays, dictionaries, and sets, create table like containers for each class. Your classes are Math, Science, English and History with a total of 17 unique students with 7 students in each class. Print out each class roster and experiment with set operations, membership and equality.
>> **Example Output:**
* `Math = Mathew Sheets, John Winters, Sam Smith`
* `Science = Sam Smith, Carson Daily, Adam Aarons`
* `Union of Math and Science = Mathew Sheets, John Winters, Sam Smith, Carson Daily, Adam Aarons`
>> **Constraints:**
* Use Set Operations
    * intersect
    * exclusiveOr
    * union
    * subtract
* Use Set Membership and Equality
    * is equal
    * isSubsetOf
    * isSupersetOf
    * isStrictSubsetOf
    * isStrictSupersetOf
    * isDisjointWith
*/
// Data
var rows = [
    ["column_1" : "Obi-Wan",   "column_2" : "Kenobi"],
    ["column_1" : "Darth",     "column_2" : "Vader"],
    ["column_1" : "Anakin",    "column_2" : "Skywalker"],
    ["column_1" : "Darth",     "column_2" : "Sidious"],
    ["column_1" : "Padme",     "column_2" : "Amidala"],
    ["column_1" : "Mace",      "column_2" : "Windu"],
    ["column_1" : "Count",     "column_2" : "Dooku"],
    ["column_1" : "Luke",      "column_2" : "Skywalker"],
    ["column_1" : "Han",       "column_2" : "Solo"],
    ["column_1" : "Leia",      "column_2" : "Organa"],
    ["column_1" : "Chew",      "column_2" : "Bacca"],
    ["column_1" : "Boba",      "column_2" : "Fett"],
    ["column_1" : "Lando",     "column_2" : "Calrissian"],
    ["column_1" : "Kylo",      "column_2" : "Ren"],
    ["column_1" : "Poe",       "column_2" : "Dameron"],
    ["column_1" : "Finn",      "column_2" : "FN-2187"],
    ["column_1" : "Rey",       "column_2" : "Rey"]
]

// Data Types
typealias StudentKey    = String
typealias StudentValue  = String
typealias StudentName   = String
typealias ClassName     = String

typealias Student       = [StudentKey:StudentValue]
typealias Students      = [Student]
typealias Class         = Set<StudentName>
typealias Classes       = [ClassName:Class]

// Processing
var allStudents = Set<String>()
for (index, var student) in rows.enumerate() {
    let name = "\(student["column_1"]!) \(student["column_2"]!)"
    student["name"] = name
    
    rows[index] = student
    allStudents.insert(name)
}

var math = Class()
math.insert(rows[8]["name"]!)
math.insert(rows[4]["name"]!)
math.insert(rows[13]["name"]!)
math.insert(rows[11]["name"]!)
math.insert(rows[7]["name"]!)
math.insert(rows[0]["name"]!)
math.insert(rows[6]["name"]!)

var science = Class()
science.insert(rows[7]["name"]!)
science.insert(rows[12]["name"]!)
science.insert(rows[10]["name"]!)
science.insert(rows[4]["name"]!)
science.insert(rows[14]["name"]!)
science.insert(rows[6]["name"]!)
science.insert(rows[1]["name"]!)

var english = Class()
english.insert(rows[3]["name"]!)
english.insert(rows[5]["name"]!)
english.insert(rows[13]["name"]!)
english.insert(rows[16]["name"]!)
english.insert(rows[6]["name"]!)
english.insert(rows[2]["name"]!)
english.insert(rows[9]["name"]!)

var history = Class()
history.insert(rows[7]["name"]!)
history.insert(rows[0]["name"]!)
history.insert(rows[15]["name"]!)
history.insert(rows[2]["name"]!)
history.insert(rows[4]["name"]!)
history.insert(rows[6]["name"]!)
history.insert(rows[5]["name"]!)

var classes = Classes()
classes["Math"] = math
classes["Science"] = science
classes["Engligh"] = english
classes["History"] = history

print("All \(rows.count) students")
for student in rows {
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

var mathBoys = Class()
mathBoys.insert(rows[13]["name"]!)
mathBoys.insert(rows[0]["name"]!)
mathBoys.insert(rows[7]["name"]!)
mathBoys.insert(rows[6]["name"]!)
mathBoys.insert(rows[4]["name"]!)

var mathGirls = Class()
mathGirls.insert(rows[11]["name"]!)
mathGirls.insert(rows[8]["name"]!)

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
