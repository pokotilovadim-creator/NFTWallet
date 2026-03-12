import Foundation

struct NFCCard: Identifiable, Codable {
    var id = UUID()
    var name: String
    var data: String
    var dateAdded: Date
}
