import Foundation
import UserNotifications

class NotificationManager: ObservableObject {
    static let shared = NotificationManager()
    
    private init() {}
    
    /// Schedules a notification for tomorrow at 7:30 AM with tomorrow's quote
    func scheduleNotificationForTomorrow() {
        // Remove any existing notifications
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        // Get tomorrow's quote
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
        let tomorrowQuote = QuoteManager.shared.getQuoteForDate(tomorrow)
        
        // Create notification content
        let content = UNMutableNotificationContent()
        content.title = "Daily Wisdom"
        content.body = tomorrowQuote
        content.sound = .default
        
        // Schedule for tomorrow at 7:30 AM
        var dateComponents = Calendar.current.dateComponents([.year, .month, .day], from: tomorrow)
        dateComponents.hour = 7
        dateComponents.minute = 30
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: "dailyWisdom", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            } else {
                let formatter = DateFormatter()
                formatter.dateStyle = .medium
                formatter.timeStyle = .short
                if let scheduledDate = Calendar.current.date(from: dateComponents) {
                    print("Notification scheduled for: \(formatter.string(from: scheduledDate))")
                    print("Quote: \(tomorrowQuote)")
                }
            }
        }
    }
}
