import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Daily Wisdom")
                .font(.largeTitle)
                .padding()

            Text("Loaded \(QuoteManager.shared.quotes.count) quotes")
                .padding()

            if let firstQuote = QuoteManager.shared.quotes.first {
                Text(firstQuote)
                    .padding()
                    .multilineTextAlignment(.center)
            }
        }
    }
}

#Preview {
    ContentView()
}
