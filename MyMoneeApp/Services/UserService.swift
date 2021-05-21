//
//  UserService.swift
//  MyMoneeApp
//
//  Created by MacBook on 21/05/21.
//

import Foundation

class UserService {
    let url: String = "http://127.0.0.1:8080/user"
    
    // BY ID
    func getUserById(userId: String, completion: @escaping (_ dream: UserResponse) -> Void) {
        
        let decoder = JSONDecoder()
        guard let url = URL(string: url)?.appendingPathComponent(userId) else {
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
            print(String(data: data, encoding: .utf8)!)
            do {
                let data = try decoder.decode(UserResponse.self, from: data)
                completion(data)
            } catch {
                let error = error
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
    func updateUser(_ userId: String,uploadDataModel: UserResponse, completion: @escaping () -> Void) {

        guard let url = URL(string: url)?.appendingPathComponent(userId) else {
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
    
    func getUsers(completion: @escaping (_ user: [UserResponse]) -> Void) {
        let decoder = JSONDecoder()
        guard let url = URL(string: "http://127.0.0.1:8080/dreams") else {
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
                let data = try decoder.decode([UserResponse].self, from: data)
                completion(data)
            } catch {
                let error = error
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
}
