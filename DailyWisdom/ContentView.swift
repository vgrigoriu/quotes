import SwiftUI

struct ContentView: View {
    @StateObject private var quoteManager = QuoteManager.shared
    @Environment(\.scenePhase) private var scenePhase

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("Merlin Mann's Daily Wisdom")
                .font(.title)
                .padding(.top, 20)
                .padding(.horizontal)

            Text(Date(), style: .date)
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.top, 4)

            // Scrollable content area with proper centering
            GeometryReader { geometry in
                ScrollView {
                    VStack(spacing: 16) {
                        Text(quoteManager.currentQuote)
                            .padding(.horizontal)
                            .multilineTextAlignment(.leading)
                            .font(.title2)
                            .italic()

                        HStack {
                            Spacer()
                            Link("— source", destination: URL(string: "https://github.com/merlinmann/wisdom")!)
                                .font(.caption2)
                                .padding(.horizontal)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(minHeight: geometry.size.height)
                }
                .scrollBounceBehavior(.always)
            }
        }
        .onAppear {
            quoteManager.refreshQuoteIfNeeded()
        }
        .onChange(of: scenePhase) { _, newPhase in
            if newPhase == .active {
                quoteManager.refreshQuoteIfNeeded()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
