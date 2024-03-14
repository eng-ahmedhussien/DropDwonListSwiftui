enum DropDownStyle {
    case `default`
    case custom(config: DropDwonListStyleConfig)
}
extension DropDownStyle {
    var styleConfig: DropDwonListStyleConfig {
        switch self {
        case .default:
            return DropDwonListStyleConfig(
                buttonBackgroundColor: .white,
                buttonStrokeColor: .black,
                buttonTextColor: .black,
                buttonCornerRadius: 25,
                buttonHeight: 40,
                
                listItemBackgroundColor: .white,
                listItemHoverColor: .gray.opacity(0.5),
                listItemTextColor: .black,
                listBackgroundColor: .white,
                listHeight: 200,
                listItemTextAlingment: .center
                
            )
        case .custom(let config):
            return config
        }
    }
}
struct DropDwonListStyleConfig {
    
    let buttonBackgroundColor: Color
    let buttonStrokeColor: Color
    let buttonTextColor: Color
    let buttonCornerRadius: CGFloat
    let buttonHeight: CGFloat
    //list
    let listItemBackgroundColor: Color
    let listItemHoverColor: Color
    let listItemTextColor: Color
    let listBackgroundColor: Color
    let listHeight: CGFloat
    let listItemTextAlingment : Alignment
    
}
