//
//  NetworkManager.swift
//  Assignment
//
//  Created by mradulatray on 30/05/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://jsonplaceholder.typicode.com/posts"
    
    func fetchPosts(page: Int, completion: @escaping ([Post]?) -> Void) {
        let url = URL(string: "\(baseURL)?_page=\(page)")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            do {
                let posts = try JSONDecoder().decode([Post].self, from: data)
                completion(posts)
            } catch {
                completion(nil)
            }
        }
        task.resume()
    }
}
