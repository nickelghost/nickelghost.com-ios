import Foundation

extension NickelghostAPI.Error {
    var errorDescription: String? {
        switch self {
        case .invalidURL: "Provided URL is invalid."
        case .cannotConnect(let reason): reason
        case .invalidResponse: "Server returned an invalid response."
        case .cannotDecode(let reason): reason
        }
    }
}


class NickelghostAPI {
    static let base = "https://nickelghost.com"
    
    enum Error: LocalizedError {
        case invalidURL
        case cannotConnect(reason: String)
        case invalidResponse
        case cannotDecode(reason: String)
    }
    
    static private func call<T: Codable>(path: String) async throws -> T {
        guard let url = URL(string: base+path) else { throw self.Error.invalidURL }
        
        var data: Data
        var response: URLResponse
        do {
            (data, response) = try await URLSession.shared.data(from: url)
        } catch {
            throw self.Error.cannotConnect(reason: error.localizedDescription)
        }
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw self.Error.invalidResponse
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw self.Error.cannotDecode(reason: error.localizedDescription)
        }
    }
    
    static func getHomepage() async throws -> HomePage {
        return try await self.call(path: "/homepage.json")
    }
    
    static func getProjects() async throws -> [Project] {
        return try await self.call(path: "/projects.json")
    }
    
    static func getWorkplaces() async throws -> [Workplace] {
        return try await self.call(path: "/workplaces.json")
    }
}
