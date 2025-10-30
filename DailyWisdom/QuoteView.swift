import SwiftUI

struct QuoteView: View {
    let quote: String
    
    var body: some View {
        Text(quote)
            .padding(.horizontal)
            .multilineTextAlignment(.leading)
            .font(.title2)
            .italic()
    }
}
