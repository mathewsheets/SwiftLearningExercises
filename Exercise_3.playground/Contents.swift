/*:
**Exercise:** You have a secret message to send. Write a playground that can encrypt strings with an alphabetical [caesar cipher](https://en.wikipedia.org/wiki/Caesar_cipher). This cipher can ignore numbers, symbols, and whitespace. Add a shift variable to indicate how many places to shift.
>> **Example Output:**
* Decrypted: Nearly all men can stand adversity, but if you want to test a man's character, give him power
* Encrypted: arneyl nyy zra pna fgnaq nqirefvgl, ohg vs lbh jnag gb grfg n zna'f punenpgre, tvir uvz cbjre
>> **Constraints:**
* Use a `switch` statment
* Use a loop statement
*/
import Foundation

let alphaLower = "abcdefghijklmnopqrstuvwxyz"
let alphaUpper = alphaLower.uppercaseString
let alphaLowerCount = alphaLower.characters.count
let alphaUpperCount = alphaUpper.characters.count

var shiftValue = 13
var initial = "Nearly all men can stand adversity, but if you want to test a man's character, give him power."

var encrypted = ""
for char in initial.characters {
    var charString = String(char)
    
    let alpha: String
    let alphaCount: Int
    
//    switch char {
//    case alphaLower.characters.startIndex..<alphaLower.characters.endIndex:
//        alpha = alphaLower
//    case alphaUpper.characters:
//        alpha = alphaUpper
//    default:
//        encrypted += charString
//        continue
//    }

    if alphaLower.containsString(charString) {
        alpha = alphaLower
    } else if alphaUpper.containsString(charString) {
        alpha = alphaUpper
    } else {
        encrypted += charString
        continue
    }
    alphaCount = alpha.characters.count

    let found = alpha.rangeOfString(charString)!
    let distanceToEnd = found.startIndex.distanceTo(alpha.endIndex)
    var advancedBy = ((alphaCount - distanceToEnd) + shiftValue) % alphaCount
    encrypted += alpha.substringWithRange(alpha.startIndex.advancedBy(advancedBy)..<alpha.startIndex.advancedBy(advancedBy + 1))
}

var decrypted = ""
for char in encrypted.characters {
    var charString = String(char)
    
    let alpha: String
    let alphaCount: Int
    if alphaLower.containsString(charString) {
        alpha = alphaLower
    } else if alphaUpper.containsString(charString) {
        alpha = alphaUpper
    } else {
        decrypted += charString
        continue
    }
    alphaCount = alpha.characters.count

    let found = alpha.rangeOfString(charString)!
    let distanceToEnd = found.startIndex.distanceTo(alpha.endIndex)
    var advancedBy = ((alphaCount - distanceToEnd) + shiftValue) % alphaCount
    decrypted += alpha.substringWithRange(alpha.startIndex.advancedBy(advancedBy)..<alpha.startIndex.advancedBy(advancedBy + 1))
}

print("Decrypted: \(decrypted)")
print("Encrypted: \(encrypted)")
