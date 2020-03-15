//
//  Double.swift
//  NBP
//
//  Created by XCodeClub on 2020-03-15.
//  Copyright © 2020 XCodeClub. All rights reserved.
//

import Foundation

extension Double {
    func roundToPlace(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
