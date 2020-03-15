//
//  PostNetworking.swift
//  NBP
//
//  Created by XCodeClub on 2020-03-09.
//  Copyright © 2020 XCodeClub. All rights reserved.
//

import Foundation

class PostNetworking {
    
    private init() {}
    static let shared = PostNetworking()
    
    //MARK:-Func for MainScrenn
    static func get(endPoint: String, completion: @escaping(GetResponse)->Void) {
        let mainUrl = "http://api.nbp.pl/api/exchangerates/tables/"
        let endPoint = "/\(endPoint)/?format=json"
        guard let url = URL(string: mainUrl + endPoint) else {
                return
            print("wrong Url")
        }
        Networking.shared.getForFirstVC(url: url) { (json) in
                let response = GetResponse(json: json)
                completion(response)
            }
        }
    
    //MARK:-Func for MainScreenCTable
    static func getForCTable(endPoint: String, completion: @escaping(GetResponseforCTable)->Void) {
    let mainUrl = "http://api.nbp.pl/api/exchangerates/tables/"
    let endPoint = "/\(endPoint)/?format=json"
    guard let url = URL(string: mainUrl + endPoint) else {
            return
        print("wrong Url")
    }
    Networking.shared.getForFirstVCCTable(url: url) { (json) in
            let response = GetResponseforCTable(json: json)
            completion(response)
        }
    }
    
    //MARK:-Func for SecondScreen
    static func getCurrency(endPoint: String, code: String, from: String, to: String, completion: @escaping(GetResponseFromSecondVC)->Void) {
        let end = "/\(endPoint)/\(code)/\(from)/\(to)/?format=json"
        let url2 = "http://api.nbp.pl/api/exchangerates/rates\(end)"
        guard let url = URL(string: url2) else {
                    return
                print("wrong Url")
                 }
         Networking.shared.getForSecondVC(url: url) { (json) in
                       let response = GetResponseFromSecondVC(json: json)
                       completion(response)
        }
    }
    
    //MARK:-Func for SecondScreenCTable
    static func getCurrencyForCTable(endPoint: String, code: String, from: String, to: String, completion: @escaping(GetResponseFromSecondVCCTable)->Void) {
        let end = "/\(endPoint)/\(code)/\(from)/\(to)/?format=json"
        let url2 = "http://api.nbp.pl/api/exchangerates/rates\(end)"
        guard let url = URL(string: url2) else {
                    return
                print("wrong Url")
                 }
         Networking.shared.getForSecondVCCTable(url: url) { (json) in
                       let response = GetResponseFromSecondVCCTable(json: json)
                       completion(response)
        }
    }
}


