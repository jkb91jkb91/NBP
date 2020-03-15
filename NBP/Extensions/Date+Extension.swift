//
//  extension.swift
//  NBP
//
//  Created by XCodeClub on 2020-03-15.
//  Copyright © 2020 XCodeClub. All rights reserved.
//

import Foundation

struct DateFunc {
    
    static func toString(date:Date) ->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
  
}
