import SwiftUI

struct QuoteView: View {
    let quote: String
    let font: Font
    
    init(quote: String, font: Font = .title2) {
        self.quote = quote
        self.font = font
    }
    
    var body: some View {
        Text(quote)
            .padding(.horizontal)
            .multilineTextAlignment(.leading)
            .font(self.font)
            .italic()
    }
}
