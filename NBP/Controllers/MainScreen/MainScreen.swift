//
//  ViewController.swift
//  NBP
//
//  Created by XCodeClub on 2020-03-09.
//  Copyright © 2020 XCodeClub. All rights reserved.
//

import UIKit

//MARK:-Class
class MainScreen: UIViewController {
    
    //MARK:-Properties
    var downloadedDataModel = [ModelMainScreen]()
    var downloadedDataModelForCTable = [ModelMainScreenCTable]()
    var segmentSelected = Table.A
    var numberOfrowsInTable:Int!
    let refreshControl = UIRefreshControl()
    @IBOutlet weak var table: UITableView!
    
    //MARK:-Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        allSetup()
        downloadData()
    }
    
    //MARK:-Actions
     @IBAction func segmentedControl(_ sender: UISegmentedControl) {
           switch sender.selectedSegmentIndex {
           case 0:
            segmentSelected = Table.A
               downloadData()
           case 1:
            segmentSelected = Table.B
               downloadData()
           default:
            segmentSelected = Table.C
               downloadDataForCTable()
           }
       }
    
    //MARK:-Functions
    func allSetup() {
        customizeTable()
        customizeRefreshController()
    }
    
    func customizeTable() {
        table.rowHeight = 100
        table.separatorStyle = .singleLine
        table.separatorColor = .white
        table.refreshControl = refreshControl
    }
    
    func customizeRefreshController() {
        refreshControl.tintColor = .red
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
   
    func downloadData(){
        refreshControl.beginRefreshing()
        PostNetworking.get(endPoint: segmentSelected) { (response) in
            self.downloadedDataModel = response.array
            let rowNumber = response.array[0].rates.count
            self.numberOfrowsInTable = rowNumber
            DispatchQueue.main.async {
                self.table.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }
    
    func downloadDataForCTable(){
        refreshControl.beginRefreshing()
        PostNetworking.getForCTable(endPoint: segmentSelected) { (response) in
            self.downloadedDataModelForCTable = response.array
            let rowNumber = response.array[0].rates.count
            self.numberOfrowsInTable = rowNumber
            DispatchQueue.main.async {
                self.table.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == Segues.segueFirst {
               if let vc = segue.destination as? SecondScreen {
                   if let select = table.indexPathForSelectedRow?.row {
                    switch segmentSelected {
                    case "A","B":
                            vc.topTitle = downloadedDataModel[0].rates[select].currency
                            vc.segment = self.segmentSelected
                            vc.code = downloadedDataModel[0].rates[select].code
                            
                    default:
                        vc.topTitle = downloadedDataModelForCTable[0].rates[select].currency
                        vc.segment = self.segmentSelected
                        vc.code = downloadedDataModelForCTable[0].rates[select].code
                    }
                }
            }
        }
    }
    
    //MARK:-Selectors
    @objc func refreshData() {
          downloadData()
      }
}

