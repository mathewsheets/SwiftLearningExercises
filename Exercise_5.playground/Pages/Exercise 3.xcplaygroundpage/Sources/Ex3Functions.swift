import Foundation

let alphaLower = "abcdefghijklmnopqrstuvwxyz"
let alphaUpper = alphaLower.uppercaseString
let alphaLowerCount = alphaLower.characters.count
let alphaUpperCount = alphaUpper.characters.count

public func encrypt(text: String, shiftValue: Int) -> String {

    return build(text, shiftValue: shiftValue, encrypt: true)
}

public func decrypt(text: String, shiftValue: Int) -> String {
    
    return build(text, shiftValue: shiftValue, encrypt: false)
}

func build(text: String, shiftValue: Int, encrypt: Bool) -> String {

    let shift = shiftValue == Int.max ? shiftValue - alphaLowerCount : shiftValue

    var string = ""

    for character in text.characters {
        let letter = String(character)

        let alphaAndCount = lowerOrUpper(String(character))
        if alphaAndCount == nil {
            string.appendContentsOf(letter)
            continue
        }
        let alpha = alphaAndCount!.0
        let alphaCount = alphaAndCount!.1
        let found = alpha.rangeOfString(letter)!

        var advancedBy = 0
        if encrypt {
            let distance = alphaCount - found.startIndex.distanceTo(alpha.endIndex)
            advancedBy = (distance + shift) % alphaCount
        } else {
            let distance = alpha.startIndex.distanceTo(found.startIndex)
            advancedBy = (distance - shift) % alphaCount
            advancedBy = advancedBy < 0 ? alphaCount - -advancedBy : advancedBy
        }

        let append = alpha.substringWithRange(alpha.startIndex.advancedBy(advancedBy)..<alpha.startIndex.advancedBy(advancedBy + 1))
        string.appendContentsOf(append)
    }

    return string
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
