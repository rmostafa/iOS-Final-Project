//
//  Task.swift
//  To Do
//
//  Created by Rami Mostafa on 12/5/17.
//  Copyright © 2017 rmostafa. All rights reserved.
//

import Foundation

@objc class Task: NSObject {
    
    var name: String!
    var info: String!
    var startTime: String!
    var endTime: String!
    
    init(name: String, info: String, startTime: String, endTime: String) {
        self.name = name
        self.info = info
        self.startTime = startTime
        self.endTime = endTime
    }
    
}
