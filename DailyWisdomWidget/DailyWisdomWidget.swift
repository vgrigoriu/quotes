import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), quote: "Loading wisdom...")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let quote = QuoteManager.shared.getQuoteForDate(Date())
        completion(SimpleEntry(date: Date(), quote: quote))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let currentDate = Date()
        let quote = QuoteManager.shared.getQuoteForDate(currentDate)
        let entry = SimpleEntry(date: currentDate, quote: quote)

        // Update at midnight tomorrow
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
        let midnight = Calendar.current.startOfDay(for: tomorrow)

        let timeline = Timeline(entries: [entry], policy: .after(midnight))
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let quote: String
}

struct DailyWisdomWidgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        Text(entry.quote)
            .font(.body)
            .multilineTextAlignment(.center)
            .padding()
    }
}

struct DailyWisdomWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "DailyWisdomWidget", provider: Provider()) { entry in
            DailyWisdomWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .supportedFamilies([.systemMedium])
    }
}
