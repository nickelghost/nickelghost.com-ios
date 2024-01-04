import Foundation

struct RemoteImage: Codable {
    var src: String
    let width: Int
    let height: Int
    let format: String
}
