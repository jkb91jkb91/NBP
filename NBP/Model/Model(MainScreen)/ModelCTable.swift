//
//  ModelCTable.swift
//  NBP
//
//  Created by XCodeClub on 2020-03-15.
//  Copyright © 2020 XCodeClub. All rights reserved.
//

import Foundation

struct ModelMainScreenCTable: Decodable {
    var table: String
    var rates: [RateC]
    var effectiveDate: String
}

struct RateC: Decodable {
    var currency: String
    var code: String
    var bid: Double
    var ask: Double
}
