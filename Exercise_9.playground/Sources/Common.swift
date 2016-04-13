import Foundation

public enum PetType {
    case Dog
    case Cat
}

public enum Loudness {
    case Soft
    case Medium
    case Very
}

public enum When {
    case AM
    case PM
}

public struct Mouse {
    
    internal var color: String
    
    init(color: String) {
        
        self.color = color
    }
}
