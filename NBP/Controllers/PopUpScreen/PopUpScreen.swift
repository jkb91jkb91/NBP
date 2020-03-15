//
//  POPViewController.swift
//  NBP
//
//  Created by XCodeClub on 2020-03-14.
//  Copyright © 2020 XCodeClub. All rights reserved.
//

import UIKit

//MARK:-Protocol
protocol DateProtocol {
    func sendDate(pickerDate: String, buttonSelected: String)
}

//MARK:-Class
class PopUpScreen: UIViewController {
    
    //MARK:-Properties
    var dateFromPicker = String()
    var fromDate = Date()
    var toDate = Date()
    var buttonSelected = ButtonValues.to
    var delegate:DateProtocol?
    @IBOutlet weak var datePicker: UIDatePicker!
   
    //MARK:-Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    //MARK:-Actions
     @IBAction func buttonOk(_ sender: Any) {
        setDateIfNotSelected()
        delegate?.sendDate(pickerDate: dateFromPicker, buttonSelected: buttonSelected)
        dismissPopUp()
    }
    
     @IBAction func pickerAction(_ sender: UIDatePicker) {
        convertDateToString(date: sender.date)
        print(sender.date)
    }
    
    //MARK:-Functions
    func dismissPopUp(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func convertDateToString(date: Date) {
        
        if buttonSelected == ButtonValues.from {
            
            if date > toDate {
                dateFromPicker = DateFunc.toString(date: toDate)
                fromDate = toDate
            } else {
                dateFromPicker = DateFunc.toString(date: date)
                fromDate = date
            }
        } else {
            
            if date > fromDate {
                dateFromPicker = DateFunc.toString(date: date)
                toDate = date
            } else {
                dateFromPicker = DateFunc.toString(date: fromDate)
                toDate = fromDate
            }
        }
    }
    
    func setDateIfNotSelected() {
        if dateFromPicker.isEmpty == true{
            dateFromPicker = DateFunc.toString(date: Date())
        }
    }
}
