import SwiftUI

struct ContentView: View {

    @EnvironmentObject var store: CardStore
    @State private var unlocked = false

    var body: some View {
        NavigationView {
            VStack {
                if unlocked {
                    ScrollView {
                        ForEach(store.cards) { card in
                            CardView(card: card)
                        }
                    }

                    NavigationLink("Добавить карту") {
                        AddCardView()
                    }
                    .padding()

                } else {
                    Button("Разблокировать Face ID") {
                        FaceIDManager.authenticate { success in
                            unlocked = success
                        }
                    }
                }
            }
            .navigationTitle("NFC Wallet")
        }
    }
}
