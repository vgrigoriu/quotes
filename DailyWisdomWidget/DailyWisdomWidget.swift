import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
   func placeholder(in context: Context) -> SimpleEntry {
       SimpleEntry(date: Date())
   }

   func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        completion(SimpleEntry(date: Date()))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let timeline = Timeline(entries: [SimpleEntry(date: Date())], policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct DailyWisdomWidgetEntryView: View {
    var body: some View {
        Text("Hello, world!")
    }
}

struct DailyWisdomWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "DailyWisdomWidget", provider: Provider()) { _ in
            DailyWisdomWidgetEntryView()
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .supportedFamilies([.systemMedium])
    }
}
