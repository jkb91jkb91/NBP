//
//  AlertService.swift
//  NBP
//
//  Created by XCodeClub on 2020-03-15.
//  Copyright © 2020 XCodeClub. All rights reserved.
//

import UIKit

class AlertService {
    
    static func alert(vc: UIViewController) {
        let alert = UIAlertController(title: "Choose range", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        vc.present(alert, animated: true, completion: nil)
    }
}
