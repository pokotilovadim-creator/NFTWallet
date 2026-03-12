import Foundation

class CardStore: ObservableObject {

    @Published var cards: [NFCCard] = []

    init() {
        load()
    }

    func addCard(name: String, data: String) {
        let card = NFCCard(name: name, data: data, dateAdded: Date())
        cards.append(card)
        save()
    }

    func save() {
        if let encoded = try? JSONEncoder().encode(cards) {
            UserDefaults.standard.set(encoded, forKey: "cards")
        }
    }

    func load() {
        if let data = UserDefaults.standard.data(forKey: "cards") {
            if let decoded = try? JSONDecoder().decode([NFCCard].self, from: data) {
                cards = decoded
            }
        }
    }
}
