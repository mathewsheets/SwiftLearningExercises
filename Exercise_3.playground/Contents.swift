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

let input = "Nearly all men can stand adversity, but if you want to test a man's character, give him power."
var shiftValue = 5
var encrypted = ""
var decrypted = ""
var encrypting = true
repeat {
    let text = encrypting ? input : encrypted
    for character in text.characters {
        let string = String(character)
        
        let alpha: String
        let alphaCount: Int
        if alphaLower.containsString(string) {
            alpha = alphaLower
        } else if alphaUpper.containsString(string) {
            alpha = alphaUpper
        } else {
            encrypting ? encrypted.appendContentsOf(string) : decrypted.appendContentsOf(string)
            continue
        }
        alphaCount = alpha.characters.count
        
        let found = alpha.rangeOfString(string)!
        let distance: Int
        var advancedBy: Int
        if encrypting {
            distance = alphaCount - found.startIndex.distanceTo(alpha.endIndex)
            advancedBy = (distance + shiftValue) % alphaCount
        } else {
            distance = alpha.startIndex.distanceTo(found.startIndex)
            advancedBy = (distance - shiftValue) % alphaCount
            if advancedBy < 0 {
                advancedBy = alphaCount - -advancedBy
            }
        }
        
        let append = alpha.substringWithRange(alpha.startIndex.advancedBy(advancedBy)..<alpha.startIndex.advancedBy(advancedBy + 1))
        encrypting ? encrypted.appendContentsOf(append) : decrypted.appendContentsOf(append)
    }

    encrypting = !encrypting
} while decrypted.isEmpty

print("Decrypted: \(decrypted)")
print("Encrypted: \(encrypted)")