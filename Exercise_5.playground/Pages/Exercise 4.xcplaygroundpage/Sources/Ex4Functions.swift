import Foundation

public typealias StudentKey    = String
public typealias StudentValue  = String
public typealias StudentName   = String
public typealias ClassName     = String

public typealias Student       = [StudentKey:StudentValue]
public typealias Students      = [Student]
public typealias Class         = Set<StudentName>
public typealias Classes       = [ClassName:Class]

public func getStudents() -> Students {

    return [
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
}

public func getEntireClass(inout students: Students) -> Class {
    
    var allStudents = Class()

    for (index, var student) in students.enumerate() {
        let name = "\(student["column_1"]!) \(student["column_2"]!)"
        student["name"] = name
        
        students[index] = student
        allStudents.insert(name)
    }
    
    return allStudents
}

public func getMathStudents(students: Students) -> Class {
    
    var math = Class()
    
    math.insert(students[8]["name"]!)
    math.insert(students[4]["name"]!)
    math.insert(students[13]["name"]!)
    math.insert(students[11]["name"]!)
    math.insert(students[7]["name"]!)
    math.insert(students[0]["name"]!)
    math.insert(students[6]["name"]!)
    
    return math
}

public func getMathBoyStudents(students: Students) -> Class {
    
    var math = Class()
    
    math.insert(students[13]["name"]!)
    math.insert(students[0]["name"]!)
    math.insert(students[7]["name"]!)
    math.insert(students[6]["name"]!)
    math.insert(students[4]["name"]!)
    
    return math
}

public func getMathGirlStudents(students: Students) -> Class {
    
    var math = Class()

    math.insert(students[11]["name"]!)
    math.insert(students[8]["name"]!)
    
    return math
}

public func getScienceStudents(students: Students) -> Class {
    
    var science = Class()
    
    science.insert(students[7]["name"]!)
    science.insert(students[12]["name"]!)
    science.insert(students[10]["name"]!)
    science.insert(students[4]["name"]!)
    science.insert(students[14]["name"]!)
    science.insert(students[6]["name"]!)
    science.insert(students[1]["name"]!)

    return science
}

public func getEnglishStudents(students: Students) -> Class {
    
    var english = Class()
    
    english.insert(students[3]["name"]!)
    english.insert(students[5]["name"]!)
    english.insert(students[13]["name"]!)
    english.insert(students[16]["name"]!)
    english.insert(students[6]["name"]!)
    english.insert(students[2]["name"]!)
    english.insert(students[9]["name"]!)
    
    return english
}

public func getHistoryStudents(students: Students) -> Class {
    
    var history = Class()
    
    history.insert(students[7]["name"]!)
    history.insert(students[0]["name"]!)
    history.insert(students[15]["name"]!)
    history.insert(students[2]["name"]!)
    history.insert(students[4]["name"]!)
    history.insert(students[6]["name"]!)
    history.insert(students[5]["name"]!)
    
    return history
}

public func getSemester(classes: [Class]) -> Classes {
    
    var classes = Classes()

    for _class in classes {
        
        classes[_class.0] = _class.1
    }

    return classes
}
