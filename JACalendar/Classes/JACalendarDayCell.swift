//
//  JACalendarDayCell.swift
//  JACalendar
//
//  Created by Jayachandra on 12/6/19.
//

import UIKit

public class JACalendarDayCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var dayLabel: UILabel!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 5
    }
}
