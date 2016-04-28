import Foundation

// the contract for the Container
public protocol Container {

    associatedtype ItemType

    func addItem(item: ItemType)

    func removeItem(item: ItemType) -> ItemType?

    var count: Int { get }

    subscript(i: Int) -> ItemType { get }
}
