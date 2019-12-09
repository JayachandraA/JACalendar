//
//  JADate+Extention.swift
//  JACalendar
//
//  Created by Jayachandra on 12/6/19.
//

import Foundation


extension Date {
    func startDayOfMonth() ->Date?{
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: self)
        let startOfMonth = calendar.date(from: components)
        return startOfMonth
    }
    
    func endDayOfMonth() ->Date?{
        var comps = DateComponents()
        comps.month = 1
        comps.day = -1
        let calendar = Calendar.current
        let endOfMonth = calendar.date(byAdding: comps, to: startDayOfMonth()!)
        return endOfMonth
    }
    
    func numberOfDays(year: Int, month: Int) ->Int?{
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month

        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)
        let range = calendar.range(of: .day, in: .month, for: date!)
        return range?.count
    }
    
    static func startDayName(year: Int, month: Int) ->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "eee"
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateStr = "\(year)-\(month)-01"
        if let startDate = formatter.date(from: dateStr){
            let nameOfDay = dateFormatter.string(from: startDate)
            return nameOfDay
        }
        return ""
    }
    
    func nameOfDay() ->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "eee"
        let nameOfDay = dateFormatter.string(from: self)
        return nameOfDay
    }
    
    func nameOfMonth() ->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        let nameOfMonth = dateFormatter.string(from: self)
        return nameOfMonth
    }

}
