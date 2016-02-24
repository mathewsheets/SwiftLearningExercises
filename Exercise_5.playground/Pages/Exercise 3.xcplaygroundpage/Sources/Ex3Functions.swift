import Foundation

let alphaLower = "abcdefghijklmnopqrstuvwxyz"
let alphaUpper = alphaLower.uppercaseString
let alphaLowerCount = alphaLower.characters.count
let alphaUpperCount = alphaUpper.characters.count

public func encrypt(text: String, shiftValue: Int) -> String {

    var encrypted = ""

    for character in text.characters {
        let string = String(character)

        let alphaAndCount = lowerOrUpper(string)
        if alphaAndCount == nil {
            encrypted.appendContentsOf(string)
            continue
        }

        let alpha = alphaAndCount!.0
        let alphaCount = alphaAndCount!.1
        let found = alpha.rangeOfString(string)!
        let distance = alphaCount - found.startIndex.distanceTo(alpha.endIndex)
        let advancedBy = (distance + shiftValue) % alphaCount
        let append = alpha.substringWithRange(alpha.startIndex.advancedBy(advancedBy)..<alpha.startIndex.advancedBy(advancedBy + 1))

        encrypted.appendContentsOf(append)
    }

    return encrypted
}

public func decrypt(text: String, shiftValue: Int) -> String {
    
    var decrypted = ""
    
    for character in text.characters {
        let string = String(character)
        
        let alphaAndCount = lowerOrUpper(String(character))
        if alphaAndCount == nil {
            decrypted.appendContentsOf(string)
            continue
        }
        
        let alpha = alphaAndCount!.0
        let alphaCount = alphaAndCount!.1
        let found = alpha.rangeOfString(string)!
        let distance = alpha.startIndex.distanceTo(found.startIndex)
        var advancedBy = (distance - shiftValue) % alphaCount
        if advancedBy < 0 {
            advancedBy = alphaCount - -advancedBy
        }
        let append = alpha.substringWithRange(alpha.startIndex.advancedBy(advancedBy)..<alpha.startIndex.advancedBy(advancedBy + 1))

        decrypted.appendContentsOf(append)
    }
    
    return decrypted
}

func lowerOrUpper(character: String) -> (String, Int)? {
    
    var alpha = ""
    switch character {
    case _ where alphaLower.containsString(character):
        alpha = alphaLower
    case _ where alphaUpper.containsString(character):
        alpha = alphaUpper
    default:
        return nil
    }
    
    return (alpha, alpha.characters.count)
}