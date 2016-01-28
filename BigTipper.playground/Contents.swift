/*:
**Exercise:**
Your a big tipper! When ever you go out to eat you tip 20% of the bill and never tip less than $3. Create a playground that prints the tip amount and the total amount. Within the playground, you should be able to change the bill to see how the tip amount varies.
>> **Example Output:**
* `What is the bill? $x.xx`
* `What is the tip percentage? x`
* `The tip is $x.xx`
* `The total is $x.xx`
*/
let billAmount: Double = 87.56
let tipPercentage: Double = 0.2
let minTipAmount: Double = 3.0

var tipAmount = billAmount * tipPercentage
if tipAmount < minTipAmount {
    tipAmount = minTipAmount
}
let totalAmount = billAmount + tipAmount

let billAmountFraction = Int(billAmount % 1 * 100)
let billAmountFractionStr = billAmountFraction == 0 ? "00" : billAmountFraction < 10 ? "0\(billAmountFraction)" : "\(billAmountFraction)"
let billAmountStr = "\(Int(billAmount)).\(billAmountFractionStr)"

let tipAmountFraction = Int(tipAmount % 1 * 100)
let tipAmountFractionStr = tipAmountFraction == 0 ? "00" : tipAmountFraction < 10 ? "0\(tipAmountFraction)" : "\(tipAmountFraction)"
let tipAmountStr = "\(Int(tipAmount)).\(tipAmountFractionStr)"

let totalAmountFraction = Int(totalAmount % 1 * 100)
let totalAmountFractionStr = totalAmountFraction == 0 ? "00" : totalAmountFraction < 10 ? "0\(totalAmountFraction)" : "\(totalAmountFraction)"
let totalAmountStr = "\(Int(totalAmount)).\(totalAmountFractionStr)"

print("What is the bill? $\(billAmountStr)")
print("What is the tip percentage? \(Int(tipPercentage * 100))")
print("The tip is $\(tipAmountStr)")
print("The total is $\(totalAmountStr)")
