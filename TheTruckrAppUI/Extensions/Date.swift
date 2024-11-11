//
//  Date.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/23/23.
//

import Foundation

extension Date {
    var dateDisplayFormat: String {
        self.formatted(
            .dateTime
                .year()
                .month()
                .day()
//                .hour()
//                .minute()
        )
    }
    
    var dateAndTimeDisplayFormat: String {
        self.formatted(
            .dateTime
                .year()
                .month()
                .day()
                .hour()
                .minute()
        )
    }
    
    var timeOnlyDisplayFormat: String {
        self.formatted(date: .omitted, time: .shortened)
    }
    
    private var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
//        formatter.dateFormat = "HH:mm"
        
        return formatter
    }
    
    private var dayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateFormat = "MM/dd/yy"
        return formatter
    }
    
    private func timeString() -> String {
        return timeFormatter.string(from: self)
    }
    
    private func dateString() -> String {
        return dayFormatter.string(from: self)
    }
    
    func timestampString() -> String {
        if Calendar.current.isDateInToday(self) {
            return timeString()
        } else if Calendar.current.isDateInYesterday(self) {
            return "Yesterday"
        } else {
            return dateString()
        }
    }
}
