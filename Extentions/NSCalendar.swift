//
//  NSCalendar.swift
//  HeartRateMonitor
//
//  Created by Pavel Nadolski on 02.07.2021.
//  Copyright © 2021 AIBY. All rights reserved.
//

import Foundation

extension Calendar {
    var standaloneLocaleWeekdaySymbols:[String] {
        var calendar = Calendar.current
        calendar.locale = Locale.autoupdatingCurrent
        
        let firstWeekday = calendar.firstWeekday
        var symbols = calendar.standaloneWeekdaySymbols
        symbols = Array(symbols[firstWeekday-1..<symbols.count]) + symbols[0..<firstWeekday-1]
        let upper:[String] = symbols.map({
            $0.capitalized
        })
        return upper
    }
    
    var shortStandaloneLocaleWeekdaySymbols:[String] {
        var calendar = Calendar.current
        calendar.locale = Locale.autoupdatingCurrent
        
        let firstWeekday = calendar.firstWeekday
        var symbols = calendar.shortStandaloneWeekdaySymbols
        symbols = Array(symbols[firstWeekday-1..<symbols.count]) + symbols[0..<firstWeekday-1]
        let upper:[String] = symbols.map({
            $0.capitalized
        })
        return upper
    }
    
    func isDate(_ date1:Date, inSameHour: Date) -> Bool {
        if !self.isDate(date1, inSameDayAs: inSameHour) {
            return false
        }
        return self.component(.hour, from: date1) == self.component(.hour, from: inSameHour)
    }
}
