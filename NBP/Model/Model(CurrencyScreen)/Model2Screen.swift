//
//  Model.swift
//  NBP
//
//  Created by XCodeClub on 2020-03-14.
//  Copyright © 2020 XCodeClub. All rights reserved.
//

import Foundation

struct ModelSecondScreen: Decodable {
    var rates: [Rates]
}

struct Rates: Decodable {
    var effectiveDate: String
    var mid: Double?
}
