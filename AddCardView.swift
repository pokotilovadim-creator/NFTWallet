import SwiftUI

struct AddCardView: View {

    @EnvironmentObject var store: CardStore
    @StateObject var nfc = NFCManager()

    @State private var name = ""

    var body: some View {
        VStack(spacing: 20) {

            TextField("Название карты", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Сканировать NFC") {
                nfc.startScan()
            }

            Text(nfc.scannedData)

            Button("Сохранить карту") {
                store.addCard(name: name, data: nfc.scannedData)
            }
        }
        .padding()
        .navigationTitle("Добавить карту")
    }
}
