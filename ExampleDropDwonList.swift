struct ExampleDropDwonList: View {
    
    struct TestSelectionModel: SelectionProtocol {
        var id: String?
        var name: String?
    }
    
    @State  var normalDropDownData = DropDownData(dataArray: [
        TestSelectionModel(id: "1", name: "One"),
        TestSelectionModel(id: "4", name: "Four"),
               TestSelectionModel(id: "4", name: "Four"),
               TestSelectionModel(id: "4", name: "Four"),
               TestSelectionModel(id: "4", name: "Four"),
               TestSelectionModel(id: "4", name: "Four"),
               TestSelectionModel(id: "4", name: "Four")
        
    ])
    
    @State var se  = ""
    
    var body: some View {
        VStack(spacing: 30) {
            DropDwonList(data: $normalDropDownData, style: .default, selectionClouser: { selection in
                // selection
            })
        }
    }
}
