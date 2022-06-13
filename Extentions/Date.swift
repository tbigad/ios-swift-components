import Foundation

extension Date {
    var startOfDay: Date {
        //TODO: fix timezone
        return Calendar.current.startOfDay(for: self)
    }
    
    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }
    
    var startOfMonth: Date {
        let components = Calendar.current.dateComponents([.year, .month], from: startOfDay)
        return Calendar.current.date(from: components)!
    }
    
    var endOfMonth: Date {
        var components = DateComponents()
        components.month = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfMonth)!
    }
    
    func yearsFrom() -> Int {
        let calendar = Calendar.current
        let component = calendar.component(.year, from: self)
        let current = calendar.component(.year, from: Date())
        return current - component
    }
    
    func dateOnly(calendar: Calendar = Calendar.current) -> Date {
        let yearComponent = calendar.component(.year, from: self)
        let monthComponent = calendar.component(.month, from: self)
        let dayComponent = calendar.component(.day, from: self)
        let zone = calendar.timeZone
        
        let newComponents = DateComponents(timeZone: zone,
                                           year: yearComponent,
                                           month: monthComponent,
                                           day: dayComponent)
        let returnValue = calendar.date(from: newComponents)
        return returnValue!
    }
    
    func predicateForDay() -> NSPredicate {
        var calendar = Calendar.current
        calendar.timeZone = NSTimeZone.local
        // following creates exact midnight 12:00:00:000 AM of day
        let startOfDay = calendar.startOfDay(for: self)
        // following creates exact midnight 12:00:00:000 AM of next day
        let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
        
        return NSPredicate(format: "date >= %@ AND date < %@", argumentArray: [startOfDay, endOfDay])
    }
    
    static func daysBetweenDates(startDate: Date, endDate: Date) -> Int
    {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: startDate, to: endDate)
        return components.day ?? 0
    }
    
    func isBetween(from startDate: Date,to endDate: Date) -> Bool {
        let result = (min(startDate, endDate) ... max(startDate, endDate)).contains(self)
        return result
    }
}


extension Calendar {
    func isDate(_ date1:Date, inSameHour: Date) -> Bool {
        if !self.isDate(date1, inSameDayAs: inSameHour) {
            return false
        }
        return self.component(.hour, from: date1) == self.component(.hour, from: inSameHour)
    }
}
