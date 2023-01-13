//
//  NetworkManager.swift
//  4month3hw
//
//  Created by islam on 13/1/23.
//

import Foundation

class NetworkManager {
    
    func getBeerList(completion: @escaping ([Beer]) -> Void ) {
        let url = URL(string: "https://api.punkapi.com/v2/beers?brewed_before=11-2012&abv_gt=6")
        let request = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request) { data, _, _ in
            DispatchQueue.main.async {
                guard let data = data, let response = try? JSONDecoder().decode([Beer].self, from: data) else {
                    completion([])
                    return
                }
                completion(response)
            }
        }
        task.resume()
    }
    
    static let shared = NetworkManager()
    
}
