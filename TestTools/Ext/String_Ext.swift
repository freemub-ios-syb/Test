//
//  String_Ext.swift
//  TestTools
//
//  Created by 舒圆波 on 17/11/8.
//  Copyright © 2017年 舒圆波. All rights reserved.
//

import Foundation

extension String {
    
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return self.data(using: .utf8)!
    }
    
}
