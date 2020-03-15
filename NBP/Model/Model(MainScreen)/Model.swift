//
//  Model.swift
//  NBP
//
//  Created by XCodeClub on 2020-03-09.
//  Copyright © 2020 XCodeClub. All rights reserved.
//

import Foundation

struct ModelMainScreen: Decodable {
    var table: String
    var rates: [Rate]
    var effectiveDate: String
}

struct Rate: Decodable {
    var currency: String
    var code: String
    var mid: Double?
}
