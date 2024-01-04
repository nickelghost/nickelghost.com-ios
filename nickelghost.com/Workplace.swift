import Foundation

struct Workplace: Codable {
    let priority: Int
    let companyName: String
    let title: String
    let description: String
    let technologies: [String]
    let startDate: String
    let endDate: String
}
