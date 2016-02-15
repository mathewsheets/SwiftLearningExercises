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

var matt        = Student(); matt       ["name"] = "Matt";
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

var engligh = Class()
engligh.insert(students[3]["name"]!)
engligh.insert(students[5]["name"]!)
engligh.insert(students[13]["name"]!)
engligh.insert(students[16]["name"]!)
engligh.insert(students[6]["name"]!)
engligh.insert(students[2]["name"]!)
engligh.insert(students[9]["name"]!)

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
classes["Engligh"] = engligh
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



