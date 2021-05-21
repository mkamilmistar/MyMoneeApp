//
//  TransactionService.swift
//  MyMoneeApp
//
//  Created by MacBook on 20/05/21.
//

import Foundation

class TransactionService {
    
    let url: String = "https://60a5decac0c1fd00175f48af.mockapi.io/api/v1/transaction"
//    let url: String = "http://127.0.0.1:8080/transactions"
//    let url2: String = "127.0.0.1:8080/transaction"
    
    func getTransaction(completion: @escaping (_ transaction: [TransactionResponse]) -> Void) {
        guard let url = URL(string: url) else {
            print("Error: cannot create URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let data = try JSONDecoder().decode([TransactionResponse].self, from: data)
                completion(data)
            } catch {
                let error = error
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
    func addTransaction(uploadDataModel: TransactionResponse, completion: @escaping () -> Void) {
        
        guard let url = URL(string: url) else {
            print("Error: cannot create URL")
            return
        }
        
        guard let jsonData = try? JSONEncoder().encode(uploadDataModel) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) {(_, _, _) in
           completion()
        }
        print(task)
        task.resume()
    }
    
    func updateTransaction(uploadDataModel: TransactionResponse, completion: @escaping () -> Void) {
        
        let transactionId = "/\(uploadDataModel.transactionId!)"
        
        guard let url = URL(string: url)?.appendingPathComponent(transactionId) else {
            print("Error: cannot create URL")
            return
        }
        
        guard let jsonData = try? JSONEncoder().encode(uploadDataModel) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) {(_, _, _) in
           completion()
        }
        task.resume()
    }
    
    func deleteTransaction(_ transactionId: String, completion: @escaping () -> Void ) {
        
        let transactionId = "/\(transactionId)"
        
        guard let url = URL(string: url)?.appendingPathComponent(transactionId) else {
            print("Error: cannot create URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        
        let task = URLSession.shared.dataTask(with: request) {(_, _, _) in
           completion()
        }
        task.resume()
    }
    
    // BY ID
    func getTransactionByID(transactionId: String, completion: @escaping (_ dream: TransactionResponse) -> Void) {
        
        let decoder = JSONDecoder()
        guard let url = URL(string: url)?.appendingPathComponent(transactionId) else {
            print("Error: cannot create URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
            guard let data = data else {
                return
            }
//            print(String(data: data, encoding: .utf8)!)
            do {
                let data = try decoder.decode(TransactionResponse.self, from: data)
                completion(data)
            } catch {
                let error = error
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
}
