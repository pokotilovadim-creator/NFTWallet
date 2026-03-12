import SwiftUI

struct CardView: View {

    var card: NFCCard

    var body: some View {
        VStack(alignment: .leading) {
            Text(card.name)
                .font(.title)
                .bold()

            Spacer()

            Text(card.data)
                .font(.caption)
        }
        .padding()
        .frame(height: 180)
        .background(
            LinearGradient(colors: [.purple, .blue],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
        )
        .cornerRadius(20)
        .foregroundColor(.white)
        .padding()
    }
}
