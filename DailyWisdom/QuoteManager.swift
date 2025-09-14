import Foundation

class QuoteManager {
    static let shared = QuoteManager()
    private let shuffledQuotes: [String]

    // Epoch date: September 14, 2025
    private let epochDate = Calendar.current.date(from: DateComponents(year: 2025, month: 9, day: 14))!

    private init() {
        shuffledQuotes = Self.shuffle(Self.loadQuotes())
    }
    
    private static func loadQuotes() -> [String] {
        // Read wisdom.md from app bundle
        guard let path = Bundle.main.path(forResource: "wisdom", ofType: "md"),
              let content = try? String(contentsOfFile: path, encoding: .utf8) else {
            print("Could not load wisdom.md file")
            return []
        }

        // Parse quotes from bullet-point format
        let lines = content.components(separatedBy: .newlines)
        let parsedQuotes = lines
            .filter { $0.hasPrefix("- ") }  // Only lines starting with "- "
            .map { line in
                String(line.dropFirst(2)).trimmingCharacters(in: .whitespaces)
            }
            .filter { !$0.isEmpty }  // Remove any empty quotes

        print("QuoteManager: Loaded \(parsedQuotes.count) quotes from wisdom.md")
        if let firstQuote = parsedQuotes.first {
            print("QuoteManager: First quote: \(firstQuote)")
        }

        return parsedQuotes
    }

    /// Shuffles the quotes array using a fixed seed for consistent ordering
    private static func shuffle(_ quotes: [String]) -> [String] {
        guard !quotes.isEmpty else {
            return []
        }

        // Seed the C library random number generator with our fixed seed
        srand48(19800822)

        // Create a simple generator that uses drand48()
        struct CRandomGenerator: RandomNumberGenerator {
            mutating func next() -> UInt64 {
                return UInt64(drand48() * Double(UInt64.max))
            }
        }

        var generator = CRandomGenerator()
        let shuffled = quotes.shuffled(using: &generator)

        print("QuoteManager: Created shuffled quotes array with \(shuffled.count) quotes")

        return shuffled
    }

    /// Returns today's quote based on days elapsed since epoch (September 14, 2025)
    /// The same quote will be returned for the entire day, with a predictable sequence across days
    func getTodaysQuote() -> String {
        guard !shuffledQuotes.isEmpty else {
            return "No quotes available"
        }

        // Calculate days since epoch (September 14, 2025)
        let daysSinceEpoch = Calendar.current.dateComponents([.day], from: epochDate, to: Date()).day ?? 0

        // Handle negative days properly using modulo arithmetic
        // This ensures: Day -1 → last quote, Day -2 → second-to-last, etc.
        let index = ((daysSinceEpoch % shuffledQuotes.count) + shuffledQuotes.count) % shuffledQuotes.count

        return shuffledQuotes[index]
    }
}
