/*:
**Exercise:** You have to record all the students and their grades for your school. Leveraging arrays, dictionaries, and sets create table like containers for each class. Your classes are Math, Science, English and History with a total of 17 unique students. Print out each class roster and use and experiment with set operations and set membership and equality.
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
typealias StudentKey    = String
typealias StudentValue  = String
typealias Student       = [StudentKey:StudentValue]
typealias Students      = [Student]

typealias StudentName   = String
typealias Class         = Set<StudentName>

typealias ClassName     = String
typealias Classes       = [ClassName:Class]

var matt        = Student(); matt       ["name"] = "Matt";      matt    ["last"] = ""
var annie       = Student(); annie      ["name"] = "Annie";
var sam         = Student(); sam        ["name"] = "Sam";
var jack        = Student(); jack       ["name"] = "Jack";
var hudson      = Student(); hudson     ["name"] = "Hudson";
var oliver      = Student(); oliver     ["name"] = "Oliver";
var carson      = Student(); carson     ["name"] = "Carson";
var rick        = Student(); rick       ["name"] = "Rick";
var joanne      = Student(); joanne     ["name"] = "Joanne";
var jennifer    = Student(); jennifer   ["name"] = "Jennifer";
var brian       = Student(); brian      ["name"] = "Brian";
var danielle    = Student(); danielle   ["name"] = "Danielle";
var mike        = Student(); mike       ["name"] = "Mike";
var carl        = Student(); carl       ["name"] = "Carl";
var becky       = Student(); becky      ["name"] = "Becky";
var amber       = Student(); amber      ["name"] = "Amber";
var todd        = Student(); todd       ["name"] = "Todd";

var students = Students()
students.append(matt)
students.append(annie)
students.append(sam)
students.append(jack)
students.append(hudson)
students.append(oliver)
students.append(carson)
students.append(rick)
students.append(joanne)
students.append(jennifer)
students.append(brian)
students.append(danielle)
students.append(mike)
students.append(carl)
students.append(becky)
students.append(amber)
students.append(todd)

var allStudents = Set<String>()
for student in students {
    allStudents.insert(student["name"]!)
}

var math = Class()
math.insert(students[8]["name"]!)
math.insert(students[4]["name"]!)
math.insert(students[13]["name"]!)
math.insert(students[11]["name"]!)
math.insert(students[7]["name"]!)
math.insert(students[0]["name"]!)
math.insert(students[6]["name"]!)

var science = Class()
science.insert(students[7]["name"]!)
science.insert(students[12]["name"]!)
science.insert(students[10]["name"]!)
science.insert(students[4]["name"]!)
science.insert(students[14]["name"]!)
science.insert(students[6]["name"]!)
science.insert(students[1]["name"]!)

var english = Class()
english.insert(students[3]["name"]!)
english.insert(students[5]["name"]!)
english.insert(students[13]["name"]!)
english.insert(students[16]["name"]!)
english.insert(students[6]["name"]!)
english.insert(students[2]["name"]!)
english.insert(students[9]["name"]!)

var history = Class()
history.insert(students[7]["name"]!)
history.insert(students[0]["name"]!)
history.insert(students[15]["name"]!)
history.insert(students[2]["name"]!)
history.insert(students[4]["name"]!)
history.insert(students[6]["name"]!)
history.insert(students[5]["name"]!)

var classes = Classes()
classes["Math"] = math
classes["Science"] = science
classes["Engligh"] = english
classes["History"] = history

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
    print("Math is a subset of all students")
}
if !english.isSubsetOf(history) {
    print("English is not a subset of History")
}
if allStudents.isSupersetOf(history) {
    print("All students is a superset of History")
}

var mathBoys = Class()
mathBoys.insert(students[13]["name"]!)
mathBoys.insert(students[0]["name"]!)
mathBoys.insert(students[7]["name"]!)
mathBoys.insert(students[6]["name"]!)
mathBoys.insert(students[4]["name"]!)

var mathGirls = Class()
mathGirls.insert(students[11]["name"]!)
mathGirls.insert(students[8]["name"]!)

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