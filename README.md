# JACalendar

[![CI Status](https://img.shields.io/travis/JayachandraA/JACalendar.svg?style=flat)](https://travis-ci.org/JayachandraA/JACalendar)
[![Version](https://img.shields.io/cocoapods/v/JACalendar.svg?style=flat)](https://cocoapods.org/pods/JACalendar)
[![License](https://img.shields.io/cocoapods/l/JACalendar.svg?style=flat)](https://cocoapods.org/pods/JACalendar)
[![Platform](https://img.shields.io/cocoapods/p/JACalendar.svg?style=flat)](https://cocoapods.org/pods/JACalendar)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

JACalendar is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'JACalendar'
```

## Usage

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

## Author

JayachandraA, ajchandra15@gmail.com

## License

JACalendar is available under the MIT license. See the LICENSE file for more info.
