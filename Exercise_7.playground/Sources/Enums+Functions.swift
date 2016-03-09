import Foundation

public enum ModelName: String {
    case iPhone = "iPhone"
    case iPhone3G = "iPhone 3G"
    case iPhone3Gs = "iPhone 3Gs"
    case iPhone4 = "iPhone 4"
    case iPhone4s = "iPhone 4s"
    case iPhone5 = "iPhone 5"
    case iPhone5c = "iPhone 5c"
    case iPhone5s = "iPhone 5s"
    case iPhone6 = "iPhone 6"
    case iPhone6Plus = "iPhone 6 Plus"
    case iPhone6s = "iPhone 6s"
    case iPhone6sPlus = "iPhone 6s Plus"
}

public enum ModelNumber: String {
    case A1203
    case A1324
    case A1241
    case A1325
    case A1303
    case A1349
    case A1332
    case A1431
    case A1387
    case A1428
    case A1429
    case A1442
    case A1532
    case A1456
    case A1507
    case A1529
    case A1533
    case A1453
    case A1457
    case A1530
    case A1549
    case A1586
    case A1522
    case A1524
    case A1633
    case A1688
    case A1634
    case A1687
}

public enum HardwareString: String {
    case iPhone1_1 = "iPhone1,1"
    case iPhone1_2 = "iPhone1,2"
    case iPhone2_1 = "iPhone2,1"
    case iPhone3_1 = "iPhone3,1"
    case iPhone3_2 = "iPhone3,2"
    case iPhone3_3 = "iPhone3,3"
    case iPhone4_1 = "iPhone4,1"
    case iPhone5_1 = "iPhone5,1"
    case iPhone5_2 = "iPhone5,2"
    case iPhone5_3 = "iPhone5,3"
    case iPhone5_4 = "iPhone5,4"
    case iPhone6_1 = "iPhone6,1"
    case iPhone6_2 = "iPhone6,2"
    case iPhone7_2 = "iPhone7,2"
    case iPhone7_1 = "iPhone7,1"
    case iPhone8_1 = "iPhone8,1"
    case iPhone8_2 = "iPhone8,2"
}

public enum OSVersion: Int {
    case _1 = 1, _2, _3, _4, _5, _6, _7, _8, _9
}

public typealias Phone = (ModelName, ModelNumber, HardwareString, OSVersion)

public enum PhoneCreationError: ErrorType {
    case ModelNumberInvalid(ModelNumber, with: ModelName)
    case HardwareStringInvalid(HardwareString, with: ModelName)
    case OSVersionInvalid(OSVersion, with: ModelName)
}

public func createPhone(modelName: ModelName, modelNumber: ModelNumber, hardwareString: HardwareString, osVersion: OSVersion) throws -> Phone {

    guard validModelNumber(modelNumber, forModelName: modelName) else {
        throw PhoneCreationError.ModelNumberInvalid(modelNumber, with: modelName)
    }
    guard validHardwareString(hardwareString, forModelName: modelName) else {
        throw PhoneCreationError.HardwareStringInvalid(hardwareString, with: modelName)
    }
    guard validOSVersion(osVersion, forModelName: modelName) else {
        throw PhoneCreationError.OSVersionInvalid(osVersion, with: modelName)
    }
    
    return (modelName, modelNumber, hardwareString, osVersion)
}

func validModelNumber(modelNumber: ModelNumber, forModelName: ModelName) -> Bool {
    
    switch forModelName {
    case .iPhone where [.A1203].contains(modelNumber):
        return true
    case .iPhone3G where [.A1324, .A1241].contains(modelNumber):
        return true
    case .iPhone3Gs where [.A1325, .A1303].contains(modelNumber):
        return true
    case .iPhone4 where [.A1349, .A1332].contains(modelNumber):
        return true
    case .iPhone4s where [.A1431, .A1387].contains(modelNumber):
        return true
    case .iPhone5 where [.A1428, .A1429, .A1442].contains(modelNumber):
        return true
    case .iPhone5c where [.A1532, .A1456, .A1507, .A1529].contains(modelNumber):
        return true
    case .iPhone5s where [.A1533, .A1453, .A1457, .A1530].contains(modelNumber):
        return true
    case .iPhone6 where [.A1549, .A1586].contains(modelNumber):
        return true
    case .iPhone6Plus where [.A1522, .A1524].contains(modelNumber):
        return true
    case .iPhone6s where [.A1633, .A1688].contains(modelNumber):
        return true
    case .iPhone6sPlus where [.A1634, .A1687].contains(modelNumber):
        return true
    default:
        return false
    }
}

func validHardwareString(hardwareString: HardwareString, forModelName: ModelName) -> Bool {
    
    switch forModelName {
    case .iPhone where [.iPhone1_1].contains(hardwareString):
        return true
    case .iPhone3G where [.iPhone1_2].contains(hardwareString):
        return true
    case .iPhone3Gs where [.iPhone2_1].contains(hardwareString):
        return true
    case .iPhone4 where [.iPhone3_1, .iPhone3_2, .iPhone3_3].contains(hardwareString):
        return true
    case .iPhone4s where [.iPhone4_1].contains(hardwareString):
        return true
    case .iPhone5 where [.iPhone5_1, .iPhone5_2].contains(hardwareString):
        return true
    case .iPhone5c where [.iPhone5_3, .iPhone5_4].contains(hardwareString):
        return true
    case .iPhone5s where [.iPhone6_1, .iPhone6_2].contains(hardwareString):
        return true
    case .iPhone6 where [.iPhone7_2].contains(hardwareString):
        return true
    case .iPhone6Plus where [.iPhone7_1].contains(hardwareString):
        return true
    case .iPhone6s where [.iPhone8_1].contains(hardwareString):
        return true
    case .iPhone6sPlus where [.iPhone8_2].contains(hardwareString):
        return true
    default:
        return false
    }
}

func validOSVersion(osVersion: OSVersion, forModelName: ModelName) -> Bool {
    
    switch forModelName {
    case .iPhone where [._1, ._2, ._3].contains(osVersion):
        return true
    case .iPhone3G where [._2, ._3, ._4].contains(osVersion):
        return true
    case .iPhone3Gs where [._3, ._4, ._5, ._6].contains(osVersion):
        return true
    case .iPhone4 where [._4, ._5, ._6, ._7].contains(osVersion):
        return true
    case .iPhone4s where [._5, ._6, ._7, ._8, ._9].contains(osVersion):
        return true
    case .iPhone5 where [._6, ._7, ._8, ._9].contains(osVersion):
        return true
    case .iPhone5c where [._7, ._8, ._9].contains(osVersion):
        return true
    case .iPhone5s where [._7, ._8, ._9].contains(osVersion):
        return true
    case .iPhone6 where [._8, ._9].contains(osVersion):
        return true
    case .iPhone6Plus where [._8, ._9].contains(osVersion):
        return true
    case .iPhone6s where [._9].contains(osVersion):
        return true
    case .iPhone6sPlus where [._9].contains(osVersion):
        return true
    default:
        return false
    }
}
