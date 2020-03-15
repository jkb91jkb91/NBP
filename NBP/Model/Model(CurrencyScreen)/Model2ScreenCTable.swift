//
//  ModelCurrencyScreenCTable.swift
//  NBP
//
//  Created by XCodeClub on 2020-03-15.
//  Copyright © 2020 XCodeClub. All rights reserved.
//

import Foundation

struct ModelSecondScreenCTable: Decodable {
    var rates: [RatesC]
}

struct RatesC: Decodable {
    var effectiveDate: String
    var ask: Double
    var bid: Double
}
