import Foundation

public func getTipAmount(billAmount: Double, tipPercentage: Double, minTipAmount: Double = 3.0) -> Double {
    
    let initialTipAmount = billAmount * tipPercentage
    
    return initialTipAmount < minTipAmount ? minTipAmount : initialTipAmount
}

public func getTotalAmount(billAmount: Double, tipAmount: Double) -> Double {
    
    return billAmount + tipAmount
}

public func doubleAsInt(amount: Double) -> Int {
    
    return Int(amount)
}

public func decimalPlaceAsInt(amount: Double) -> Int {
    
    return doubleAsInt(amount: amount.truncatingRemainder(dividingBy: 1.0) * 100)
}

public func decimalPlaceString(amount: Int) -> String {
    
    return amount == 0 ? "00" : amount < 10 ? "0\(amount)" : "\(amount)"
}

public func getFinalString(amount: Double, decimal: String) -> String {
    
    return "\(doubleAsInt(amount: amount)).\(decimal)"
}
