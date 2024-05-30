//
//  DetailViewModel.swift
//  Assignment
//
//  Created by mradulatray on 30/05/24.
//

import Foundation

class DetailViewModel {
    
    var postData: Post?
    
    func getid() -> String {
        if let id = postData?.id {
            return String(id)
        } else {
            return ""
        }
    }
    
    
    func userID() -> String {
        if let userid = postData?.userId {
            return String(userid)
        } else {
            return ""
        }
        
    }
    
    
    func body() -> String {
        if let body = postData?.body {
            return body
        } else {
            return ""
        }
    }
    
    func title() -> String {
        if let title = self.postData?.title {
            return title
        } else {
            return ""
        }
    }
}
