//
//  Hero.swift
//  JsonTableViewWithImageSwift
//
//  Created by Raj on 21/06/17.
//  Copyright © 2017 Raj. All rights reserved.
//

import Foundation

class Hero{
  
    var name: String?
    var team: String?
    var imageUrl: String?
    var realname : String?
    var firstappearance : String?
    var bio : String?
    
    init(name: String?, team: String?, imageUrl: String? , realname: String? , firstappearance : String? , bio:String?) {
        self.name = name
        self.team = team
        self.imageUrl = imageUrl
        self.realname = realname
        self.firstappearance = firstappearance
        self.bio = bio
    }
}
