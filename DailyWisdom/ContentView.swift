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

            Spacer()

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
                        //.foregroundColor(.secondary)
                        .padding(.horizontal)
                }
            }

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
