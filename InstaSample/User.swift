//
//  User.swift
//  InstaSample
//
//  Created by 土屋光暉 on 2018/06/09.
//  Copyright © 2018年 mitsuki.com. All rights reserved.
//

import UIKit

class User: NSObject {

    var objectId: String
    var userName: String
    var displayName: String?
    var introduction: String?
    
    init(objectId: String, userName: String) {
        self.objectId = objectId
        self.userName = userName
    }
    
    
    
}
