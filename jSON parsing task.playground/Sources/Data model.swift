import Foundation

public struct Welcome: Decodable {
    
    public var cards: [Card]
}

public struct Card: Decodable {
    
    public var name: String
    public var type: String
    public var manaCost: String?
    public let setName: String
}

