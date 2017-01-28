/*:
 * callout(Exercise): You have a secret message to send. Write a playground that can encrypt strings with an alphabetical [caesar cipher](https://en.wikipedia.org/wiki/Caesar_cipher). This cipher can ignore numbers, symbols, and whitespace.
 
 **Example Output:**
 - Decrypted: Nearly all men can stand adversity, but if you want to test a man's character, give him power
 - Encrypted: arneyl nyy zra pna fgnaq nqirefvgl, ohg vs lbh jnag gb grfg n zna'f punenpgre, tvir uvz cbjre
 
 **Constraints:**
 - The encrypted and decrypted text is case sensitive
 - Add a shift variable to indicate how many places to shift
 */
import Foundation

let alphaLower = "abcdefghijklmnopqrstuvwxyz"
let alphaUpper = alphaLower.uppercased()
let alphaLowerCount = alphaLower.characters.count
let alphaUpperCount = alphaUpper.characters.count

let input = "Nearly all men can stand adversity, but if you want to test a man's character, give him power."
let shiftValue = 8
var encrypted = ""
var decrypted = ""
var encrypting = true
repeat {
    let text = encrypting ? input : encrypted
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
        let distance: Int
        var advancedBy: Int
        if encrypting {
            distance = alphaCount - alpha.distance(from: found.lowerBound, to: alpha.endIndex)
            advancedBy = (distance + shiftValue) % alphaCount
        } else {
            distance = alpha.characters.distance(from: alpha.startIndex, to: found.lowerBound)
            advancedBy = (distance - shiftValue) % alphaCount
            if advancedBy < 0 {
                advancedBy = alphaCount - -advancedBy
            }
        }

        let append = alpha.substring(with: alpha.characters.index(alpha.startIndex, offsetBy: advancedBy)..<alpha.characters.index(alpha.startIndex, offsetBy: advancedBy + 1))
        encrypting ? encrypted.append(append) : decrypted.append(append)
    }

    encrypting = !encrypting
} while decrypted.isEmpty

print("Decrypted: \(decrypted)")
print("Encrypted: \(encrypted)")
