//
//  NetworkManager.swift
//  DominionPedia
//
//  Created by billy pak on 8/5/21.
//

import UIKit


class NetworkManager {
    static let shared   = NetworkManager()
    let baseURL         = "https://dominioncardapi.pythonanywhere.com/cardset/"
    
    private init() {}
    
    
    func getCardList(for expansion: String, page: Int, completed: @escaping (Result<[Card], DPError>) -> Void) {
        
        let endpoint = baseURL
        let semaphore = DispatchSemaphore (value: 0)
        
        
        var request = URLRequest(url: URL(string: endpoint)!,timeoutInterval: Double.infinity)
        request.addValue("Token 0b4b13fa0a972c198b52efa63d9224b182f0af6c", forHTTPHeaderField: "Authorization")
            
        request.httpMethod = "GET"
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let _ = error {
                completed(.failure(.invalidCard))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let jsonData = data else {
                completed(.failure(.invalidData))
                //semaphore.signal()
                return
            }
            semaphore.signal()
            do {
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let cardlist = try decoder.decode([Card].self, from: jsonData)
                semaphore.signal()
                completed(.success(cardlist))
                
            } catch {
                completed(.failure(.invalidData))
                print(error.localizedDescription)
                print(String(describing: error))
            }
            
            //print(String(data: data, encoding: .utf8)!)
            
        }
        
        task.resume()
        semaphore.wait()
    }
    
}
