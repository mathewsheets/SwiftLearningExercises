import Foundation

let alphaLower = "abcdefghijklmnopqrstuvwxyz"
let alphaUpper = alphaLower.uppercased()
let alphaLowerCount = alphaLower.characters.count
let alphaUpperCount = alphaUpper.characters.count

public func encrypt(text: String, shift: Int) -> String {

    return build(text: text, shift: shift, encrypt: true)
}

public func decrypt(text: String, shift: Int) -> String {
    
    return build(text: text, shift: shift, encrypt: false)
}

func build(text: String, shift: Int, encrypt: Bool) -> String {

    var string = ""
    let shifting = shift == Int.max ? shift - alphaLowerCount : shift

    for character in text.characters {

        let alphaAndCount = lowerOrUpper(character: String(character))
        if alphaAndCount == nil {
            string.append(character)
            continue
        }
        let alpha = alphaAndCount!.0
        let alphaCount = alphaAndCount!.1
        let found = alpha.range(of: String(character))!

        var advancedBy = 0
        if encrypt {
            let distance = alphaCount - alpha.distance(from: found.lowerBound, to: alpha.endIndex)
            advancedBy = (distance + shifting) % alphaCount
        } else {
            let distance = alpha.characters.distance(from: alpha.startIndex, to: found.lowerBound)
            advancedBy = (distance - shifting) % alphaCount
            advancedBy = advancedBy < 0 ? alphaCount - -advancedBy : advancedBy
        }

        let append = alpha.substring(with: alpha.characters.index(alpha.startIndex, offsetBy: advancedBy)..<alpha.characters.index(alpha.startIndex, offsetBy: advancedBy + 1))
        string.append(append)
    }

    return string
}

func lowerOrUpper(character: String) -> (String, Int)? {

    var alpha = ""
    switch character {
    case _ where alphaLower.contains(character):
        alpha = alphaLower
    case _ where alphaUpper.contains(character):
        alpha = alphaUpper
    default:
        return nil
    }

    return (alpha, alpha.characters.count)
}
