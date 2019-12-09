//
//  JACalendarViewController.swift
//  FBSnapshotTestCase
//
//  Created by Jayachandra on 12/6/19.
//

import UIKit

public class JACalendarViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var calendarButton: UIButton!
    @IBOutlet weak var dayCollectionView: UICollectionView!
    @IBOutlet weak var monthYearLabel: UILabel!
    
    private let dayNames = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    private var selectedRow: IndexPath = IndexPath(row: 19, section: 0)
    private var selectedMonth: Int!
    private var selectedYear: Int!
    private var selectedDay: Int!
    private var days = [String]()
    private var selectedDate: Date!
    
        
    public var completionHandler: ((_ date: Date)->Void)?
    public var theme: JACalendarTheme?
    
    var startDate: Date? {
        didSet{
            if let _ = startDate{
                loadCalender(date: startDate!)
            }
        }
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        doneButton.layer.cornerRadius = 5
        cancelButton.layer.cornerRadius = 5
        
        // dayCollectionView object configuraion
        dayCollectionView.register(JACalendarDayCell.self, forCellWithReuseIdentifier: "JACalendarDayCell")
        dayCollectionView.register(UINib(nibName: "JACalendarDayCell", bundle: Bundle(for: JACalendarDayCell.self)), forCellWithReuseIdentifier: "JACalendarDayCell")
        dayCollectionView.delegate = self
        dayCollectionView.dataSource = self
        
        
        // dayCollectionView, configuring required rows and columns
        /*
        if let layout = dayCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let width = dayCollectionView.frame.width/7
            let height = dayCollectionView.frame.width/6
            layout.estimatedItemSize = CGSize(width: width, height: height)
        }
         */
        

        
        
        // Loading initial date or current date
        if let _ = startDate{
            loadCalender(date: startDate!)
        
            let today = Date()
            loadCalender(date: today)
        }
        
        if let lTheme = theme{
            nextButton.setImage(lTheme.nextMonthImage, for: .normal)
            nextButton.setTitle("", for: .normal)
            previousButton.setImage(lTheme.previousMonthImage, for: .normal)
            previousButton.setTitle("", for: .normal)
            calendarButton.setImage(lTheme.calendarImage, for: .normal)
            cancelButton.backgroundColor = lTheme.cancelButtonColor
            cancelButton.setTitle(lTheme.cancelButtonText, for: .normal)
            doneButton.backgroundColor = lTheme.doneButtonColor
            doneButton.setTitle(lTheme.doneButtonText, for: .normal)
            calendarButton.setTitle("", for: .normal)
        }
    }
}


//MARK: - Actions
extension JACalendarViewController{
    @IBAction func onDoneButtonTapped(_ sender: Any) {
        if let handler = completionHandler{
            handler(selectedDate!)
            onCancelButtonTapped(sender)
        }
    }
    
    @IBAction func onCancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onNextMonthButtonTapped(_ sender: Any) {
        selectedMonth += 1
        if selectedMonth == 13{
            selectedMonth = 1
            selectedYear += 1
        }
        updateNumberOfDaysInMonth()
    }
    
    @IBAction func onPreviousMonthButtonTapped(_ sender: Any) {
        selectedMonth -= 1
        if selectedMonth == 0{
            selectedMonth = 12
            selectedYear -= 1
        }
        updateNumberOfDaysInMonth()
    }
    
    @IBAction func onCalendarButtonTapped(_ sender: Any) {
        startDate = Date()
    }
}


//MARK: - Functions
extension JACalendarViewController{
    
    func loadCalender(date: Date) {
        guard let lDate = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: date)) else {
            fatalError("Failed to strip time from Date object")
        }
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: lDate)
        loadMonthData(date: lDate, year: components.year!, month: components.month!)
        
        // default selected date will be currnt date
        selectedDate = lDate
        selectedYear = components.year!
        selectedMonth = components.month!
    }
    
    func updateNumberOfDaysInMonth(){
        guard let lSelectedMonth = selectedMonth,
            let lSelectedYear = selectedYear,
            let lSelectedDay = selectedDay else { return }
        
        // create temp starting day
        let dateStr = "\(lSelectedYear)-\(lSelectedMonth)-\(lSelectedDay)"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let startDate = formatter.date(from: dateStr){
            loadMonthData(date: startDate, year: lSelectedYear, month: lSelectedMonth)
        }
    }
    
    func loadMonthData(date : Date, year: Int, month: Int) {
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        
        // Identify when the day starts in the associated year and month
        // Then append the empty string to the days arra to to show collection view
        let startDayName = Date.startDayName(year: components.year!, month: components.month!)
        days.removeAll()
        for day in dayNames {
            if day == startDayName{
                break
            }
            days.append("")
        }
        
        // Add number of days in the given month in the given year
        if let lDays = Date().numberOfDays(year: year, month: month){
            for item in 1...lDays {
                days.append("\(item)")
            }
        }
        
        // Identify the current day to show the today date
        for (index, item) in days.enumerated() {
            if item == "\(components.day!)"{
                selectedRow = IndexPath(row: index, section: 0)
                selectedDay = Int(item)
                break
            }
        }

        // Display the month and year selected
        if isViewLoaded{
            monthYearLabel.text = "\(date.nameOfMonth())-\(components.year!)"
            dayCollectionView.reloadData()
        }
    }
    

    func setSelectedDate(str: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT:0)!
        selectedDate = formatter.date(from: str)
    }
}


//MARK: - CollectionView
extension JACalendarViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return days.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JACalendarDayCell", for: indexPath) as! JACalendarDayCell
        cell.dayLabel.text = days[indexPath.row]
        if selectedRow.row == indexPath.row{
            if let theme = theme{
                cell.containerView.backgroundColor = theme.selectedDayColor
            }else{
                cell.containerView.backgroundColor = .green
            }
            cell.dayLabel.textColor = .white
        }else{
            cell.containerView.backgroundColor = .white
            cell.dayLabel.textColor = .black
        }
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let day = days[indexPath.row]
        if day.isEmpty{return}
        
        // to reload the ui
        selectedRow = indexPath
        collectionView.reloadData()
        
        if let lSelectedYear = selectedYear, let lSelectedMonth = selectedMonth{
            let finalDate = "\(lSelectedMonth)-\(day)-\(lSelectedYear)"
            selectedDay = Int(day)
            setSelectedDate(str: finalDate)
        }
    }
}

extension JACalendarViewController: UICollectionViewDelegateFlowLayout{
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = dayCollectionView.frame.width/8
        let height = dayCollectionView.frame.width/7
        let size = CGSize(width: width, height: height)
        return size
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

