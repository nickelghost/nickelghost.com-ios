import Foundation

struct HomePage: Codable {
    let heading: String
    let paragraph1: [String]
    let paragraph2: [String]
    let paragraph3: [String]
    let dateOfBirth: Date
    var isGingerFotoEnabled: Bool
}
