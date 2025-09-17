import SwiftUI
import UserNotifications

@main
struct DailyWisdomApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    requestNotificationPermissions()
                }
        }
    }

    private func requestNotificationPermissions() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) { granted, error in
            if granted {
                print("Notification permissions granted")
            } else if let error = error {
                print("Notification permission error: \(error)")
            } else {
                print("Notification permissions denied")
            }

            // Always post notification when permissions are handled (granted or denied)
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: .permissionsHandled, object: nil)
            }
        }
    }
}

extension Notification.Name {
    static let permissionsHandled = Notification.Name("permissionsHandled")
}
