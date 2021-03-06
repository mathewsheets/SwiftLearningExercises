/*:
 * callout(Exercise): We need to model the set of possible iPhones manufactured. Replace each possible tuple property value with an enumeration that would be appropriate to the current non enumeration value.
*/
let iPhone          = (modelName: "iPhone", modelNumbers: ["A1203"], hardwareStrings: ["iPhone1,1"], osVersions: [1, 2, 3])
let iPhone3G        = (modelName: "iPhone 3G", modelNumbers: ["A1324", "A1241"], hardwareStrings: ["iPhone1,2"], osVersions: [2, 3, 4])
let iPhone3Gs       = (modelName: "iPhone 3Gs", modelNumbers: ["A1325", "A1303"], hardwareStrings: ["iPhone2,1"], osVersions: [3, 4, 5, 6])
let iPhone4         = (modelName: "iPhone 4", modelNumbers: ["A1349", "A1332"], hardwareStrings: ["iPhone3,1", "iPhone3,2", "iPhone3,3"], osVersions: [4, 5, 6, 7])
let iPhone4s        = (modelName: "iPhone 4s", modelNumbers: ["A1431", "A1387"], hardwareStrings: ["iPhone4,1"], osVersions: [5, 6, 7, 8, 9])
let iPhone5         = (modelName: "iPhone 5", modelNumbers: ["A1428", "A1429", "A1442"], hardwareStrings: ["iPhone5,1", "iPhone5,2"], osVersions: [6, 7, 8, 9])
let iPhone5c        = (modelName: "iPhone 5c", modelNumbers: ["A1532", "A1456", "A1507", "A1529"], hardwareStrings: ["iPhone5,3", "iPhone5,4"], osVersions: [7, 8, 9])
let iPhone5s        = (modelName: "iPhone 5s", modelNumbers: ["A1533", "A1453", "A1457", "A1530"], hardwareStrings: ["iPhone6,1", "iPhone6,2"], osVersions: [7, 8, 9])
let iPhone6         = (modelName: "iPhone 6", modelNumbers: ["A1549", "A1586"], hardwareStrings: ["iPhone7,2"], osVersions: [8, 9])
let iPhone6Plus     = (modelName: "iPhone 6 Plus", modelNumbers: ["A1522", "A1524"], hardwareStrings: ["iPhone7,1"], osVersions: [8, 9])
let iPhone6s        = (modelName: "iPhone 6s", modelNumbers: ["A1633", "A1688"], hardwareStrings: ["iPhone8,1"], osVersions: [9])
let iPhone6sPlus    = (modelName: "iPhone 6s Plus", modelNumbers: ["A1634", "A1687"], hardwareStrings: ["iPhone8,2"], osVersions: [9])

let phones = [iPhone, iPhone3G, iPhone3Gs, iPhone4, iPhone4s, iPhone5, iPhone5c, iPhone5s, iPhone6, iPhone6Plus, iPhone6s, iPhone6sPlus]
/*:
 **Constraints:**
 - Create the following Enumerations:
     - ModelName = Enumeration for all the model names
     - ModelNumber = Enumeration for all the model numbers
     - HardwareString = Enumeration for all hardware string
     - OSVersion = Enumeration for all os versions
 - Create the following Functions
    - Create a device passing in as arguments each enumeration
        - Validate the parameters using a guard statement
        - Throw an error that's appropriate to the invalid parameter value
        - Return a tuple similar to above only using the above enumerations
    - Get Device with ModelName
    - Get Device with ModelNumber
    - Get Device with HardwareString
    - Get Devices with OSVersion
 */
import Foundation

do {
    
    try initData()
    
} catch PhoneCreationError.ModelNumberInvalid(let modelNumber, let modelName) {
    print("invalid model number of \(modelNumber) for \(modelName)")
} catch PhoneCreationError.HardwareStringInvalid(let hardwareString, let modelName) {
    print("invalid hardware string of \(hardwareString) for \(modelName)")
} catch PhoneCreationError.OSVersionInvalid(let osVersion, let modelName) {
    print("invalid os version of \(osVersion) for \(modelName)")
}

// Get Device with ModelName
let _5cs = filter(phones: safePhones) { $0.0 == .iPhone5c } ?? []
if !_5cs.isEmpty {
    let _5c = _5cs.first!
    print("\(_5c.0.rawValue) by model name = \(_5c.0.rawValue)")
}

//Get Device with ModelNumber
let _6ss = filter(phones: safePhones) { $0.1 == .A1633 } ?? []
if !_6ss.isEmpty {
    let _6s = _6ss.first!
    print("\(_6s.0.rawValue) by model number \(_6s.1.rawValue)")
}

//Get Device with HardwareString
let _5ss = filter(phones: safePhones) { $0.2 == .iPhone6_1 } ?? []
if !_5ss.isEmpty {
    let _5s = _5ss.first!
    print("\(_5s.0.rawValue) by hardware string = \(_5s.2.rawValue)")
}

//Get Devices with OSVersion
let _v9s = filter(phones: safePhones) { $0.3 == ._9 } ?? []
print("version 9 phones")
for phone in _v9s {
    print("\t\(phone.0.rawValue)")
}
