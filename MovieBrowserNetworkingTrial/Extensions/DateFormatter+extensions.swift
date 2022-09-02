//
//  DateFormatter+extensions.swift
//  MovieBrowserNetworkingTrial
//
//  Created by Marc-Developer on 9/1/22.
//

import Foundation

extension DateFormatter {
    static var monthDayYearFormatting: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, yyyy"
        return formatter
    }
    
    // Create date extension that will return m/dd/yy from infoPageView
    
    static var monthDayYearDigitsOnlyFormatting: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "M/d/yy"
        return formatter
    }
}
