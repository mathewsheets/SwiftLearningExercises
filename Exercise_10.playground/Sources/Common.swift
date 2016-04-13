import Foundation

public enum Loudness {
    case Soft
    case Medium
    case Very
}

public enum When {
    case AM
    case PM
}

public class Mouse: Pet {
    
    init(color: String) {
        
        super.init(breed: "New York", color: color, age: 1, name: "mickey")
    }
}
