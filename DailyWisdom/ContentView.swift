import SwiftUI
import UserNotifications

struct ContentView: View {
    @StateObject private var quoteManager = QuoteManager.shared
    @StateObject private var notificationManager = NotificationManager.shared
    @Environment(\.scenePhase) private var scenePhase

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("Merlin Mann's Daily Wisdom")
                .font(.title)
                .padding(.top, 20)
                .padding(.horizontal)

            Text("v. \(BuildInfo.date)").font(.caption2).foregroundColor(.secondary)

            // Scrollable content area with proper centering
            GeometryReader { geometry in
                ScrollView {
                    VStack(spacing: 16) {

                        QuoteView(quote: quoteManager.currentQuote)

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
        .onChange(of: scenePhase) { _, newPhase in
            if newPhase == .active {
                quoteManager.refreshQuoteIfNeeded()
                scheduleNotificationIfAuthorized()
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: .permissionsHandled)) { _ in
            scheduleNotificationIfAuthorized()
        }
    }

    private func scheduleNotificationIfAuthorized() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                notificationManager.scheduleNotificationForTomorrow()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
