//
//  NetErrorEx.swift
//  TestTools
//
//  Created by 舒圆波 on 17/11/8.
//  Copyright © 2017年 舒圆波. All rights reserved.
//

import Foundation
import RxSwift
import Moya



extension RxSwiftMoyaError:Swift.Error {}


enum RxSwiftMoyaError {
    case NoResponse(Int,String)
    case ParseJSONError(Int,String)
    case NetWorkError(Int,String)
    var description:String {
        switch self {
        case .NoResponse(let code,let msg):
            return "errorCode=\(code),errorMsg=\(msg)"
        case .ParseJSONError(let code, let msg):
            return "errorCode=\(code),errorMsg=\(msg)"
        case .NetWorkError(let code, let msg):
            return "errorCode=\(code),errorMsg=\(msg)"
        default:
            return "未捕获的错误类型"
        }
    }
}
