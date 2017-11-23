//
//  NsDictonary+Ext.swift
//  TestTools
//
//  Created by 舒圆波 on 17/11/7.
//  Copyright © 2017年 舒圆波. All rights reserved.
//

import Foundation
extension NSDictionary {
    
    func getSignForMd5() -> String {
        let reqKeys = Array(self.allKeys) as! [String]
        let sortedKeys = reqKeys.sorted(by: {(str1 ,str2) in
            return str1.compare(str2).rawValue < 0
            }
        )
        var signStr = ""
        let keyCount = sortedKeys.count
        for i in (0..<keyCount){
            let value = self[sortedKeys[i]]!
            if i != (keyCount - 1)  {
                signStr += "\(sortedKeys[i])=\(value)&"
            }else {
                signStr += "\(sortedKeys[i])=\(value)"
            }
        }
        return signStr
    }
    
}
