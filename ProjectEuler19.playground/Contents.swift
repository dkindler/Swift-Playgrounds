// Dec 7 2015
// GOAL: https://projecteuler.net/problem=19

import Foundation

enum DayOfWeek: Int {
    case Monday = 0
    case Tuesday = 1
    case Wednesday = 2
    case Thursday = 3
    case Friday = 4
    case Saturday = 5
    case Sunday = 6
    
    func next() -> DayOfWeek {
        return DayOfWeek.init(rawValue: (self.rawValue + 1) % 7)!
    }
}

enum Month: Int {
    case January = 0
    case Feburary = 1
    case March = 2
    case April = 3
    case May = 4
    case June = 5
    case July = 6
    case August = 7
    case September = 8
    case October = 9
    case November = 10
    case December = 11
    
    
    func next() -> Month {
        return Month(rawValue: (self.rawValue + 1) % 12)!
    }
    
    func numberOfDays() -> Int {
        // Note that this function does not account for Feb. That is handeled in the Day class
        let daysWith30 = [8, 3, 5, 10]
        
        if self == Month.Feburary {
            return 28
        }
        
        if daysWith30.contains(self.rawValue) {
            return 30
        } else {
            return 31
        }
    }
}

class Day {
    var day: Int
    var dotw: DayOfWeek
    var month: Month
    var year: Int
    
    init(dotw:DayOfWeek, day: Int, month:Month, year:Int) {
        self.day = day
        self.dotw = dotw
        self.month = month
        self.year = year
    }
    
    func increment() {
        self.dotw = self.dotw.next()
        
        if self.month == Month.Feburary {
            if self.day == 28 && self.year % 4 == 0 && self.year % 400 != 0 {
                self.day += 1
                return
            } else {
                self.day == 1
                self.month = Month.March
                return
            }
        }
        
        if self.day == 30 {
            if self.month.numberOfDays() == 30 {
                self.day = 1
                self.month = self.month.next()
                return
            } else {
                self.day += 1
                return
            }
        }
        
        if self.day == 31 {
            if (self.month == Month.December) {
                self.year += 1
            }
            
            self.day = 1
            self.month = self.month.next()
            return
        }
        
        self.day += 1
        return
    }
    
    func toString() -> String {
        return "\(String(self.month.rawValue + 1))/\(String(self.day))/\(String(self.year))"
    }
}

var currentDay = Day(dotw: DayOfWeek.Monday, day: 1, month: Month.January, year: 1900)
var lastDay = Day(dotw: DayOfWeek.Monday, day: 1, month: Month.January, year: 2001)

var sundayCount:Int = 0


while (currentDay.toString() != lastDay.toString()) {
    if currentDay.dotw == DayOfWeek.Sunday {
        if currentDay.day == 1  && currentDay.year > 1900 {
            sundayCount += 1
        }
    }

    currentDay.increment()
}


sundayCount

