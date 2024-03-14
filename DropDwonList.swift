struct DropDwonList<T: SelectionProtocol>: View  {
    
    @State var isPicking = false
    @Binding var data: DropDownData<T>
    var selectionClouser: (T) -> Void
    let style: DropDownStyle
    
    //Getter Attributes
    private var styleConfig: DropDwonListStyleConfig {
        get {
            style.styleConfig
        }
    }
    private var dataCount : Int{
        data.dataArray.count
    }
    
    init(data: Binding<DropDownData<T>>, style: DropDownStyle = .default, selectionClouser: @escaping (T) -> Void) {
        self._data = data
        self.style = style
        self.selectionClouser = selectionClouser
    }
        
    var body: some View {
        HStack {
            Text(data.selection?.name ?? "Select")
                .lineLimit(1)
                .minimumScaleFactor(0.8)
                .foregroundColor(styleConfig.buttonTextColor)
            Spacer()
            Image(systemName: isPicking ? "chevron.up" : "chevron.down")
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .frame(height: styleConfig.buttonHeight)
        .background(
            RoundedRectangle(cornerRadius: styleConfig.buttonCornerRadius)
                .fill(styleConfig.buttonBackgroundColor)
                .stroke(styleConfig.buttonStrokeColor, lineWidth: 1)
        )
        .contentShape(Rectangle())
        .onTapGesture {
            isPicking.toggle()
        }
        // Picker
        .overlay(alignment: .topLeading) {
            VStack {
                if isPicking {
                    Spacer(minLength: styleConfig.buttonHeight)
                    
                    ScrollView {
                        VStack(spacing: 0) {
                            ForEach(data.dataArray, id: \.self) { item in
                               // Divider()
                                Button {
                                    data.selection = item
                                    selectionClouser(item)
                                    isPicking.toggle()
                                } label: {
                                    Text(item.name ?? "test")
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.7)
                                        .frame(height: styleConfig.buttonHeight)
                                        .frame(maxWidth: .infinity, alignment: styleConfig.listItemTextAlingment)
                                        .padding(.horizontal, 10)
                                        .background {
                                            RoundedRectangle(cornerRadius: styleConfig.buttonCornerRadius)
                                                .fill(styleConfig.listItemBackgroundColor)
                                                .padding(.horizontal, 8)
                                                .padding(.bottom, 10)
                                                .offset(y: 5)
                                        }
                                        .foregroundColor(styleConfig.listItemTextColor)
                                }
                                .buttonStyle(.plain)
                                Divider()
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .scrollIndicators(.never)
                    .frame(minHeight: dataCount < 4 ? styleConfig.buttonHeight * CGFloat(dataCount) : styleConfig.listHeight   )
                    .background(styleConfig.listBackgroundColor)
                    .clipShape(RoundedRectangle(cornerRadius: styleConfig.buttonCornerRadius))
                    .overlay(
                        RoundedRectangle(cornerRadius: styleConfig.buttonCornerRadius)
                            .stroke(styleConfig.buttonStrokeColor, lineWidth: 0.6)
                    )
                    .transition(.scale(scale: 0.8, anchor: .top).combined(with: .opacity).combined(with: .offset(y: -10)))
                }
            }
        
        }
        .padding(.horizontal, 12)
        .font(.custom("RetroComputer", size: 13))
        .animation(.easeIn(duration: 0.12), value: isPicking)
        .zIndex(1)
    }
}
