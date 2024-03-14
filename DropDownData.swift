enum DropDownImageType {
    case systemImage
    case assetImage
}
struct DropDownData<T: SelectionProtocol> {
    var dataArray: [T]
    var selection: T?
    var isValid: Bool = false
    
    mutating func selectItem(id: String) {
        guard let selectedItem = dataArray.first(where: { $0.id == id }) else { return }
        self.selection = selectedItem
    }
    
    mutating func changeDataArray(dataArray: [T]) {
        self.dataArray = dataArray
    }
}
