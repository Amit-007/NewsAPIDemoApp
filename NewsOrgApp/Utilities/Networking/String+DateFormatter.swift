//
//  String+DateFormatter.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/5/22.
//

import Foundation

public extension String {
    
    /// Date formate change
    func changeDateFormat(from currentDateFromat: DateFormat, to newDateFormat: DateFormat = .dispay) -> String? {
        let dateFormate = DateFormatter()
        dateFormate.dateFormat = currentDateFromat.rawValue
        if let convertDate = dateFormate.date(from: self) {
            dateFormate.dateFormat = newDateFormat.rawValue
            let returnDate = dateFormate.string(from: convertDate)
            return returnDate
        }
        return nil
    }
}
