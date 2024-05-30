//
//  Model.swift
//  Assignment
//
//  Created by mradulatray on 30/05/24.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
