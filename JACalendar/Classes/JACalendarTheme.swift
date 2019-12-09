//
//  JACalendarTheme.swift
//  JACalendar
//
//  Created by Jayachandra on 12/9/19.
//

import Foundation


public struct JACalendarTheme {
    public var nextMonthImage: UIImage? = nil
    public var previousMonthImage: UIImage? = nil
    public var calendarImage: UIImage? = nil
    public var doneButtonText: String = "DONE"
    public var cancelButtonText: String = "CANCEL"
    public var doneButtonColor: UIColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    public var cancelButtonColor: UIColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    public var selectedDayColor: UIColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    
    public init(){
    }
}
