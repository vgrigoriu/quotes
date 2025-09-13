import Foundation

class QuoteManager {
    static let shared = QuoteManager()
    private(set) var quotes: [String] = []
    
    private init() {
        loadQuotes()
    }
    
    private func loadQuotes() {
        // Read wisdom.md from app bundle
        guard let path = Bundle.main.path(forResource: "wisdom", ofType: "md"),
              let content = try? String(contentsOfFile: path) else {
            print("Could not load wisdom.md file")
            return
        }
        
        // Parse quotes from bullet-point format
        let lines = content.components(separatedBy: .newlines)
        quotes = lines
            .filter { $0.hasPrefix("- ") }  // Only lines starting with "- "
            .map { line in
                String(line.dropFirst(2)).trimmingCharacters(in: .whitespaces)
            }
            .filter { !$0.isEmpty }  // Remove any empty quotes
        
        print("QuoteManager: Loaded \(quotes.count) quotes from wisdom.md")
        if let firstQuote = quotes.first {
            print("QuoteManager: First quote: \(firstQuote)")
        }
    }
}
