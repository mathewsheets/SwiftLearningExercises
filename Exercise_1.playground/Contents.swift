/*:
**Exercise:**
Your a big tipper! When ever you go out to eat you tip 20% of the bill and never tip less than $3. Create a playground that prints the tip amount and the total amount. Within the playground, you should be able to change the bill to see how the tip amount varies.
>> **Example Output:**
* `What is the bill? $x.xx`
* `What is the tip percentage? x`
* `The tip is $x.xx`
* `The total is $x.xx`
*/
let billAmount = 87.56
let tipPercentage = 0.2
let minTipAmount = 3.0

var tipAmount = billAmount * tipPercentage
if tipAmount < minTipAmount {
    tipAmount = minTipAmount
}
let totalAmount = billAmount + tipAmount

// using the Modulus Operator to get the decimal value as an Int

let billAmountDecimal =    Int(billAmount % 1 * 100)
let tipAmountDecimal =     Int(tipAmount % 1 * 100)
let totalAmountDecimal =   Int(totalAmount % 1 * 100)

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
