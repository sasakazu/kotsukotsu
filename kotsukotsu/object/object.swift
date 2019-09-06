//
//  object.swift
//  kotsukotsu
//
//  Created by 笹倉一也 on 2019/09/03.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import Foundation


class Item {
    
    
    
    var goal:String = ""
    var title:String = ""
    var memo:String = ""
    var postid:String = ""
    
    
    init(goal: String, title: String, memo: String, postid:String) {

        self.goal = goal
        self.title = title
        self.memo = memo
        self.postid = postid
        

    }
    
}
