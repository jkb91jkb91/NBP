//
//  SecondViewController.swift
//  NBP
//
//  Created by XCodeClub on 2020-03-10.
//  Copyright © 2020 XCodeClub. All rights reserved.
//

import UIKit

//MARK:-Class
class SecondScreen: UIViewController {
    
    //MARK:- Properties
    var downloadedDataModel = [Rates]()
    var downloadedDataModelC = [RatesC]()
    var topTitle: String!
    var segment:String!
    var code:String!
    var buttonSelected:String!
    var fromDate: String! {
        didSet {
            fromDateLabel.text = fromDate
        }
    }
    var toDate: String! {
        didSet {
            toDateLabel.text = toDate
        }
    }
    
    let refreshControl = UIRefreshControl()
    
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var fromDateLabel: UILabel!
    @IBOutlet weak var toDateLabel: UILabel!
    @IBOutlet weak var table: UITableView!
   
    //MARK:-Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        allSetup()
        setDate()
    }
    override func viewWillAppear(_ animated: Bool) {
        AlertService.alert(vc: self)
    }
    
    //MARK:-Actions
    @IBAction func toDateButton(_ sender: Any) {
        buttonSelected = ButtonValues.to
        performSegue(withIdentifier: Segues.segueSecond, sender: self)
    }
    
    @IBAction func fromDateButton(_ sender: Any) {
           buttonSelected = ButtonValues.from
        performSegue(withIdentifier: Segues.segueSecond, sender: self)
       }
    
    //MARK:-Functions
    func allSetup() {
        customizeTable()
        CustomizeNavigationItem()
    }
    
    func customizeTable() {
        table.rowHeight = 100
        table.separatorStyle = .singleLine
        table.separatorColor = .white
        table.refreshControl = refreshControl
    }
    
    func numberOfRowsInTable()-> Int {
         if segment == "A" || segment == "B" {
                   return downloadedDataModel.count
               } else {
                   return downloadedDataModelC.count
        }
    }
    
    func customizeRefreshController() {
        refreshControl.tintColor = .red
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    func CustomizeNavigationItem() {
        navigationItem.title = topTitle.uppercased()
    }
    
    func setDate() {
        toDate = DateFunc.toString(date: Date())
        fromDate = DateFunc.toString(date: Date())
    }
    
    func downloadData() {
        refreshControl.beginRefreshing()
        switch segment{
        case "A","B":
            PostNetworking.getCurrency(endPoint: segment, code: code, from: fromDate,to: toDate ) { (response) in
                self.downloadedDataModel = response.ratesArray
                DispatchQueue.main.async {
                    self.refreshControl.endRefreshing()
                    self.table.reloadData()
                }
            }
        default:
            PostNetworking.getCurrencyForCTable(endPoint: segment, code: code, from: fromDate, to: toDate ) { (response) in
                self.downloadedDataModelC = response.ratesArray
                DispatchQueue.main.async {
                    self.refreshControl.endRefreshing()
                    self.table.reloadData()
                }
            }
        }
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.segueSecond {
            if let vc =  segue.destination as? PopUpScreen {
                vc.buttonSelected = buttonSelected!
                vc.delegate = self
            }
        }
    }
    
    //MARK:-Selectors
        @objc func refreshData() {
              downloadData()
    }
}

    

