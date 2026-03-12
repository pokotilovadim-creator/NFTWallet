import SwiftUI

@main
struct NFCWalletApp: App {
    @StateObject var store = CardStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
