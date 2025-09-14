import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Daily Wisdom")
                .font(.largeTitle)
                .padding()

            Text(QuoteManager.shared.getTodaysQuote())
                .padding()
                .multilineTextAlignment(.center)
                .font(.body)

            Text("— Merlin Mann")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.top, 8)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
