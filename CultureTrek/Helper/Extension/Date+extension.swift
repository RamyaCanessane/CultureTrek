//
//  Date+extension.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 12/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import Foundation

extension Date {
    
    static func from(year: Int,
                     month: Int,
                     day: Int,
                     hour: Int = 0,
                     minute: Int = 0,
                     second: Int = 0
    ) -> Date {
        DateComponents(
            calendar: .current,
            year: year,
            month: month,
            day: day,
            hour: hour,
            minute: minute,
            second: second
        ).date ?? .now
    }
}
