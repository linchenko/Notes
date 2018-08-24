//
//  Entry.swift
//  Notes
//
//  Created by Levi Linchenko on 24/08/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

import Foundation

class Entry: Equatable, Codable{
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.bodyText == rhs.bodyText
    }
    
    var bodyText: String
    
    init(bodyText: String) {
        
        self.bodyText = bodyText
        
    }
}
