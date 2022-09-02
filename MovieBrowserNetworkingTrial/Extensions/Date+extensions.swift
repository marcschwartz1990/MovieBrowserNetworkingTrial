//
//  Date+extensions.swift
//  MovieBrowserNetworkingTrial
//
//  Created by Marc-Developer on 9/1/22.
//

import Foundation

extension Date {
    var monthDayYearString: String {
        DateFormatter.monthDayYearFormatting.string(from: self)
    }
}
