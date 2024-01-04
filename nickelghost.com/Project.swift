import Foundation

struct Project: Codable {
    struct Link: Codable {
        let name: String
        let url: String
    }
    
    let priority: Int
    let name: String
    var image: RemoteImage?
    let imageAlt: String?
    let description: String
    let technologies: [String]
    let links: [Link]
}
