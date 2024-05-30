//
//  ViewModel.swift
//  Assignment
//
//  Created by mradulatray on 30/05/24.
//

import Foundation


class ViewModel {
    // MARK: - PROPERTY
    // ================
    var posts: [Post] = []
    var page = 1
    var isLoading = false
    var cache: [Int: String] = [:]
    
    func getPost(index: Int) -> Post? {
        guard index < posts.endIndex else { return nil}
        return posts[index]
    }
    
}
