/*:
 * callout(Exercise): You have a secret message to send. Write a playground that can encrypt strings with an alphabetical [caesar cipher](https://en.wikipedia.org/wiki/Caesar_cipher). This cipher can ignore numbers, symbols, and whitespace.
 
 **Example Output:**
 - Decrypted: Nearly all men can stand adversity, but if you want to test a man's character, give him power
 - Encrypted: arneyl nyy zra pna fgnaq nqirefvgl, ohg vs lbh jnag gb grfg n zna'f punenpgre, tvir uvz cbjre
 
 **Constraints:**
 - The encrypted and decrypted text is case sensitive
 - Add a shift variable to indicate how many places to shift: *the example output has a shift value of 13*
 */
import Foundation

let alphaLower = "abcdefghijklmnopqrstuvwxyz"
let alphaUpper = alphaLower.uppercased()
let alphaLowerCount = alphaLower.characters.count
let alphaUpperCount = alphaUpper.characters.count

let input = "Nearly all men can stand adversity, but if you want to test a man's character, give him power."
var shift = 13
var encrypted = ""
var decrypted = ""
var encrypting = true
repeat {
    let text = encrypting ? input : encrypted
    shift = shift == Int.max ? shift - alphaLowerCount : shift
    for character in text.characters {
        let string = String(character)

        var alpha: String
        var alphaCount: Int
        switch string {
        case _ where alphaLower.contains(string):
            alpha = alphaLower
        case _ where alphaUpper.contains(string):
            alpha = alphaUpper
        default:
            encrypting ? encrypted.append(string) : decrypted.append(string)
            continue
        }
        alphaCount = alpha.characters.count

        let found = alpha.range(of: string)!
        var advancedBy: Int
        if encrypting {
            let distance = alphaCount - alpha.distance(from: found.lowerBound, to: alpha.endIndex)
            advancedBy = (distance + shift) % alphaCount
        } else {
            let distance = alpha.characters.distance(from: alpha.startIndex, to: found.lowerBound)
            advancedBy = (distance - shift) % alphaCount
            advancedBy = advancedBy < 0 ? alphaCount - -advancedBy : advancedBy
        }

        let append = alpha.substring(with: alpha.characters.index(alpha.startIndex, offsetBy: advancedBy)..<alpha.characters.index(alpha.startIndex, offsetBy: advancedBy + 1))
        encrypting ? encrypted.append(append) : decrypted.append(append)
    }

    encrypting = !encrypting
} while decrypted.isEmpty

print("Decrypted: \(decrypted)")
print("Encrypted: \(encrypted)")

let equal = input == decrypted ? "Yes" : "No"

print("Does input == decrypted: \(equal)")
