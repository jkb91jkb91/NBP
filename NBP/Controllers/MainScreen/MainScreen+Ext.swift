//
//  ViewC+Ext.swift
//  NBP
//
//  Created by XCodeClub on 2020-03-09.
//  Copyright © 2020 XCodeClub. All rights reserved.
//

import UIKit

//MARK:-Table Protocols
extension MainScreen: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfrowsInTable ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.tableCellMainScreen, for: indexPath) as? MainViewCell else {
            return UITableViewCell()
        }
        
        switch segmentSelected{
        case "A", "B":
            let row = downloadedDataModel[0].rates[indexPath.row]
            let date = downloadedDataModel[0].effectiveDate
            cell.CurrencyDateLabel.text = date
            cell.CurrencyNameLabel.text = row.currency.uppercased()
            cell.AverageLabel.text = String((row.mid ?? 0).roundToPlace(places:4))
            cell.CurrencyCodeLabel.text = row.code
            return cell
        default:
            let row = downloadedDataModelForCTable[0].rates[indexPath.row]
            let date = downloadedDataModelForCTable[0].effectiveDate
            cell.CurrencyDateLabel.text = date
            cell.CurrencyNameLabel.text = row.currency.uppercased()
            cell.AverageLabel.text = String(((row.ask + row.bid)/2).roundToPlace(places: 4))
            cell.CurrencyCodeLabel.text = row.code
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Segues.segueFirst, sender: self)
    }
}
