import Foundation

public typealias Phone = (ModelName, ModelNumber, HardwareString, OSVersion)

public var safePhones = [Phone]()

public func initData() throws {

    safePhones.append(try createPhone(.iPhone, modelNumber: .A1203, hardwareString: .iPhone1_1, osVersion: ._3))
    safePhones.append(try createPhone(.iPhone3G, modelNumber: .A1324, hardwareString: .iPhone1_2, osVersion: ._2))
    safePhones.append(try createPhone(.iPhone3Gs, modelNumber: .A1325, hardwareString: .iPhone2_1, osVersion: ._5))
    safePhones.append(try createPhone(.iPhone4, modelNumber: .A1349, hardwareString: .iPhone3_1, osVersion: ._4))
    safePhones.append(try createPhone(.iPhone4s, modelNumber: .A1431, hardwareString: .iPhone4_1, osVersion: ._9))
    safePhones.append(try createPhone(.iPhone5, modelNumber: .A1428, hardwareString: .iPhone5_1, osVersion: ._9))
    safePhones.append(try createPhone(.iPhone5c, modelNumber: .A1532, hardwareString: .iPhone5_3, osVersion: ._9))
    safePhones.append(try createPhone(.iPhone5s, modelNumber: .A1533, hardwareString: .iPhone6_1, osVersion: ._9))
    safePhones.append(try createPhone(.iPhone6, modelNumber: .A1549, hardwareString: .iPhone7_2, osVersion: ._8))
    safePhones.append(try createPhone(.iPhone6Plus, modelNumber: .A1522, hardwareString: .iPhone7_1, osVersion: ._8))
    safePhones.append(try createPhone(.iPhone6s, modelNumber: .A1633, hardwareString: .iPhone8_1, osVersion: ._9))
    safePhones.append(try createPhone(.iPhone6sPlus, modelNumber: .A1634, hardwareString: .iPhone8_2, osVersion: ._9))
    
    print("Created \(safePhones.count) phones")
}
