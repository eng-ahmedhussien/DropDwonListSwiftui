protocol IdentifiableHashableCodable: Identifiable, Hashable, Codable {}
protocol SelectionProtocol:  IdentifiableHashableCodable {
    var id: String? { get }
    var name: String? { get }
    var imageType: DropDownImageType? { get }
    var imageName: String? { get }
}
extension SelectionProtocol {
    var imageType: DropDownImageType? {
        get {
            return nil
        }
    }
    
    var imageName: String? {
        get {
            return nil
        }
    }
}
