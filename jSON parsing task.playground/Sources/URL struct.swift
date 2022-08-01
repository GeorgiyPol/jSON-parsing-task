import Foundation

public struct ExampleURL {
    
    public let welcomeScheme = "https"
    public let welcomeHost = "api.magicthegathering.io"
    public let welcomePath = "/v1/cards"
    public let queryItemName = "name"
    
    public var queryItemValue: AddityValue
    
    public init(queryItemValue: AddityValue) {
        (self.queryItemValue = queryItemValue)
    }
    
    public enum AddityValue: String {
        
        case blackLotus = "Black Lotus"
        case opt = "Opt"
    }
}

