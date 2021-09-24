//
//  dataService.swift
//  Desafio W.Dental
//
//  Created by Hugo Pinheiro on 20/09/21.
//

import Foundation
import Alamofire


import Foundation
import Alamofire

struct DataService {
    
    // MARK: - Singleton
    static let shared = DataService()
    
    // MARK: - URL
    private var baseUrl = "https://jsonplaceholder.typicode.com"
    
    
    // MARK: - Endpoints
    private var posts = "/posts"
    private var comments = "/comments"
    private var todos = "/todos"
    
    
    // MARK: - Services

    func requestFetchLogin(with id: Int, completion: @escaping (Login?, Error?) -> ()) {
        let url = "\(baseUrl)\(posts)/\(id)"
        Alamofire.request(url).responseLogin { response in
            if let error = response.error {
                completion(nil, error)
                return
            }
            if let login = response.result.value {
                completion(login, nil)
                return
            }
        }
    }
    
    func requestFetchRegister(with id: Int, completion: @escaping (Register?, Error?) -> ()) {
        let url = "\(baseUrl)\(comments)/\(id)"
        Alamofire.request(url).responseRegister { response in
            if let error = response.error {
                completion(nil, error)
                return
            }
            if let request = response.result.value {
                completion(request, nil)
                return
            }
        }
    }
    
    func requestFetchReset(with id: Int, completion: @escaping (Reset?, Error?) -> ()) {
        let url = "\(baseUrl)\(todos)/\(id)"
        Alamofire.request(url).responseReset { response in
            if let error = response.error {
                completion(nil, error)
                return
            }
            if let reset = response.result.value {
                completion(reset, nil)
                return
            }
        }
    }
}
    
    
    
    
    

