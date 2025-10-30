import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> QuoteTimelineEntry {
        QuoteTimelineEntry(date: Date(), quote: "Loading wisdom...")
    }

    func getSnapshot(in context: Context, completion: @escaping (QuoteTimelineEntry) -> ()) {
        let now = Date()
        let quote = QuoteManager.shared.getQuoteForDate(now)
        completion(QuoteTimelineEntry(date: now, quote: quote))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        getSnapshot(in: context) { entry in
            // Update at midnight tomorrow
            let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: entry.date)!
            let midnight = Calendar.current.startOfDay(for: tomorrow)

            let timeline = Timeline(entries: [entry], policy: .after(midnight))
            completion(timeline)
        }
    }
}

struct QuoteTimelineEntry: TimelineEntry {
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
