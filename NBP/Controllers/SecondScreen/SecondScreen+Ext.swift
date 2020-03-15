//
//  SecondVC+Ext.swift
//  NBP
//
//  Created by XCodeClub on 2020-03-14.
//  Copyright © 2020 XCodeClub. All rights reserved.
//

import UIKit

//MARK:-Table Protocols
extension SecondScreen: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return numberOfRowsInTable()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: TableCell.tableCellSecondScreen, for: indexPath) as? SecondViewCellTableViewCell else {
            return UITableViewCell()
        }
        switch segment {
        case "A", "B":
            let row = downloadedDataModel[indexPath.row]
            cell.dateLabel.text = row.effectiveDate
            cell.averageLabel.text = String((row.mid ?? 0).roundToPlace(places:4))
            return cell
        default:
            let row = downloadedDataModelC[indexPath.row]
            cell.dateLabel.text = row.effectiveDate
            cell.averageLabel.text = String(((row.ask + row.bid)/2).roundToPlace(places:4))
            return cell
        }
    }
}
//MARK:-Protocol from POPViewController
extension SecondScreen: DateProtocol {
   
    func sendDate(pickerDate: String, buttonSelected: String) {
        switch buttonSelected {
        case ButtonValues.from:
            
            fromDate = pickerDate
            downloadData()
        default:
            toDate = pickerDate
            downloadData()
        }
    }
}
