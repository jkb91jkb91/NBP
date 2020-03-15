//
//  GetResponse.swift
//  NBP
//
//  Created by XCodeClub on 2020-03-09.
//  Copyright © 2020 XCodeClub. All rights reserved.
//

import Foundation

class GetResponse {
    
    var array: [ModelMainScreen]

    init(json: Any) {
        let data = json as! [ModelMainScreen]
        array = data
    }
}

class GetResponseforCTable {
    
    var array: [ModelMainScreenCTable]

    init(json: Any) {
        let data = json as! [ModelMainScreenCTable]
        self.array = data
    }
}

class GetResponseFromSecondVC {
    
    var ratesArray: [Rates]
    
    init(json: Any) {
        let data = json as! ModelSecondScreen
        var ratesArray = [Rates]()
        for i in data.rates {
            ratesArray.append(i)
        }
        self.ratesArray = ratesArray
    }
    
}
    
class GetResponseFromSecondVCCTable {
    
    var ratesArray: [RatesC]
    
    init(json: Any) {
        let data = json as! ModelSecondScreenCTable
        var ratesArray = [RatesC]()
        for i in data.rates {
            ratesArray.append(i)
        }
        self.ratesArray = ratesArray
    }
    
}



