//
//  Post.swift
//  InstaSample
//
//  Created by 土屋光暉 on 2018/06/09.
//  Copyright © 2018年 mitsuki.com. All rights reserved.
//

import UIKit

class Post: NSObject {

    
    var objectId: String
    var user: User
    var imageUrl: String
    var text: String
    var createDate: Date
    var isLiked: Bool?
    
    var comments: [Comment]?
    
    
    var likeCount: Int = 0
    
    init(objectId: String, user: User, imageUrl: String, text: String, createDate: Date) {
        self.objectId = objectId
        self.user = user
        self.imageUrl = imageUrl
        self.text = text
        self.createDate = createDate
    
    
}
}

