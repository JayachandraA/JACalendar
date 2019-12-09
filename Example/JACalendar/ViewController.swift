//
//  ViewController.swift
//  JACalendar
//
//  Created by JayachandraA on 12/06/2019.
//  Copyright (c) 2019 JayachandraA. All rights reserved.
//

import UIKit
import JACalendar


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func openCalendar(_ sendeR: Any){
        
        /*
         //demo 1
        let str = "11-09-2019"
        let format = DateFormatter()
        format.dateFormat = "MM-dd-yyyy"
        JACalendar.show(with: format.date(from: str), from: self) { (date) in
            print(date)
        }
        */
        
        /*
        //demo 2
        JACalendar.show(from: self) { (date) in
            print(date)
        }
         */
        
        // demo 3, customize
        var theme = JACalendarTheme()
        theme.nextMonthImage = #imageLiteral(resourceName: "ja_next")
        theme.previousMonthImage = #imageLiteral(resourceName: "ja_previous")
        theme.calendarImage = #imageLiteral(resourceName: "ja_calendar")
        JACalendar.show(from: self, theme: theme) { (date) in
            print(date)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

