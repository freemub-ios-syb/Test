//
//  CommonModdle.swift
//  TestTools
//
//  Created by 舒圆波 on 17/11/8.
//  Copyright © 2017年 舒圆波. All rights reserved.
//

import Foundation
import ObjectMapper

class CommonNetError:Mappable {
    var errorCode:Int?
    var errorMsg:String?
    
    required init?(map: Map) {
        
    }
    
    init(_code:Int,_msg:String) {
        
        self.errorCode = _code
        self.errorMsg = _msg
    }
    
    func mapping(map: Map) {
        errorCode <- map["errorCode"]
        errorMsg <- map["errorMsg"]
    }

    public var description:String {
        return self.toJSONString()!
    }
}
