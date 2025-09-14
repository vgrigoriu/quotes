import SwiftUI

struct ContentView: View {
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
                        Text(QuoteManager.shared.getTodaysQuote())
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
    }
}

#Preview {
    ContentView()
}
