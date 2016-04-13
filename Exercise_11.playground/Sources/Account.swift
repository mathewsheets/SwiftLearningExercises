import Foundation

public protocol Account {

    var description: String { get }
    
    var customer: Customer { get set }
    
    func debit(amount: Double) throws

    func credit(amount: Double)
}
