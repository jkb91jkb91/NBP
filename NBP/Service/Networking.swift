//
//  Networking.swift
//  NBP
//
//  Created by XCodeClub on 2020-03-09.
//  Copyright © 2020 XCodeClub. All rights reserved.
//

import Foundation

class Networking {
    
    private init() {}
    static let shared = Networking()
    
    //MARK:Func for MainScreen
    func getForFirstVC(url:URL, completion: @escaping (Any) -> Void) {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                print("repsonse == 200")
            }
            if let data = data {
                do{
                    let json = try JSONDecoder().decode([ModelMainScreen].self, from: data)
                    DispatchQueue.main.async {
                        completion(json)
                    }
                } catch let error as NSError{
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    //MARK:Func for MainScreenCTable
    func getForFirstVCCTable(url:URL, completion: @escaping (Any) -> Void) {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                print("repsonse == 200")
            }
            if let data = data {
                do{
                    let json = try JSONDecoder().decode([ModelMainScreenCTable].self, from: data)
                    DispatchQueue.main.async {
                        completion(json)
                    }
                } catch let error as NSError{
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    //MARK:-Func for SecondScreen
    func getForSecondVC(url:URL, completion: @escaping (Any) -> Void) {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let task = session.dataTask(with: url) { (data, response, error) in
             if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                 print("repsonse == 200")
             }
             if let data = data {
                 do{
                     let json = try JSONDecoder().decode(ModelSecondScreen.self, from: data)
                     DispatchQueue.main.async {
                         completion(json)
                     }
                 } catch let error as NSError{
                     print(error)
                 }
             }
         }
         task.resume()
     }
    
    //MARK:-Func for SecondScreenCTable
    func getForSecondVCCTable(url:URL, completion: @escaping (Any) -> Void) {
       let configuration = URLSessionConfiguration.default
       let session = URLSession(configuration: configuration)
       let task = session.dataTask(with: url) { (data, response, error) in
            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                print("repsonse == 200")
            }
            if let data = data {
                do{
                    let json = try JSONDecoder().decode(ModelSecondScreenCTable.self, from: data)
                    DispatchQueue.main.async {
                        completion(json)
                    }
                } catch let error as NSError{
                    print(error)
                }
            }
        }
        task.resume()
    }
}
