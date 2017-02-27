import Foundation

public func createPhone(modelName: ModelName, modelNumber: ModelNumber, hardwareString: HardwareString, osVersion: OSVersion) throws -> Phone {
    
    guard validModelNumber(modelNumber: modelNumber, forModelName: modelName) else {
        throw PhoneCreationError.ModelNumberInvalid(modelNumber, with: modelName)
    }
    guard validHardwareString(hardwareString: hardwareString, forModelName: modelName) else {
        throw PhoneCreationError.HardwareStringInvalid(hardwareString, with: modelName)
    }
    guard validOSVersion(osVersion: osVersion, forModelName: modelName) else {
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

func iterator(phones: [Phone], closure: (_ student: Phone) -> Void) {
    
    for index in 0..<phones.count {
        
        closure(phones[index])
    }
}


public func filter(phones: [Phone], closure: (_ phone: Phone) -> Bool) -> [Phone]? {
    
    var filter = [Phone]()
    
    iterator(phones: phones) { (phone) -> Void in
        
        if closure(phone) {
            
            filter.append(phone)
        }
    }
    
    return !filter.isEmpty ? filter : nil
}
