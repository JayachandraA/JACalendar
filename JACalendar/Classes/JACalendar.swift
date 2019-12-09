//
//  JACalendar.swift
//  FBSnapshotTestCase
//
//  Created by Jayachandra on 12/6/19.
//

import UIKit

public class JACalendar: NSObject {
    public static func show(with date:Date? = Date(),
                            from vc: UIViewController,
                            theme: JACalendarTheme? = nil,
                     completionHandler:@escaping ((_ date: Date)->Void)){
        let calendarViewController = JACalendarViewController(nibName: "JACalendarViewController",
                                                              bundle: Bundle(for: JACalendarViewController.self))
        calendarViewController.completionHandler = completionHandler
        calendarViewController.startDate = date
        calendarViewController.theme = theme
        calendarViewController.modalPresentationStyle = .custom
        vc.present(calendarViewController, animated: true, completion: nil)
    }
}
