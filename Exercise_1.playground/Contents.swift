/*:
 * callout(Exercise): Your a big tipper! When ever you go out to eat you tip 20% of the bill and never tip less than $3. Create a playground that prints the tip amount and the total amount. Within the playground, you should be able to change the bill to see how the tip amount varies.
 
 **Example Output:**
 * `What is the bill? $x.xx`
 * `What is the tip percentage? x`
 * `The tip is $x.xx`
 * `The total is $x.xx`
 
 **Constraints:**
 * Don't use the `String(format:, _, _)` initilizer
 * Use the remainder operator while creating the string
 * Use the ternary conditional operator
 */
import Foundation

let billAmount = 87.56
let tipPercentage = 0.2
let minTipAmount = 3.0

let initialTipAmount = billAmount * tipPercentage
var tipAmount = initialTipAmount < minTipAmount ? minTipAmount : initialTipAmount

let totalAmount = billAmount + tipAmount

// using the Remainder Operator to get the decimal value as an Int

let billAmountDecimal =    Int(billAmount.truncatingRemainder(dividingBy: 1.0) * 100)
let tipAmountDecimal =     Int(tipAmount.truncatingRemainder(dividingBy: 1.0) * 100)
let totalAmountDecimal =   Int(totalAmount.truncatingRemainder(dividingBy: 1.0) * 100)

// get the decimal as a string using the Ternary Conditional Operator for 0, < 10 or >= 10

let billAmountDecimalStr = billAmountDecimal == 0 ? "00" : billAmountDecimal < 10 ? "0\(billAmountDecimal)" : "\(billAmountDecimal)"
let tipAmountDecimalStr = tipAmountDecimal == 0 ? "00" : tipAmountDecimal < 10 ? "0\(tipAmountDecimal)" : "\(tipAmountDecimal)"
let totalAmountDecimalStr = totalAmountDecimal == 0 ? "00" : totalAmountDecimal < 10 ? "0\(totalAmountDecimal)" : "\(totalAmountDecimal)"

// use string interpolation to get the correct representation of the dollar about

let billAmountStr = "\(Int(billAmount)).\(billAmountDecimalStr)"
let tipAmountStr = "\(Int(tipAmount)).\(tipAmountDecimalStr)"
let totalAmountStr = "\(Int(totalAmount)).\(totalAmountDecimalStr)"

// print the values

print("What is the bill? $\(billAmountStr)")
print("What is the tip percentage? \(Int(tipPercentage * 100))")
print("The tip is $\(tipAmountStr)")
print("The total is $\(totalAmountStr)")
