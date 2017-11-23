//
//  ObservableEx.swift
//  TestTools
//
//  Created by 舒圆波 on 17/11/8.
//  Copyright © 2017年 舒圆波. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import ObjectMapper
import SwiftyJSON


let RESULT_DATA = "data"

extension Observable {
    func mapObject<T:Mappable>(type:T.Type) -> Observable<T> {
        return self.map {response in
            
            guard let result = response as? Moya.Response else {
                throw RxSwiftMoyaError.NoResponse(1001,"无响应数据")
            }
            
            guard ((200...209) ~= result.statusCode) else {
                throw RxSwiftMoyaError.NetWorkError(result.statusCode, result.description)
            }
            
            let jsonData = JSON.init(data: result.data)
            guard let dict = jsonData[RESULT_DATA].rawValue as? [String:Any] else {
                throw RxSwiftMoyaError.ParseJSONError(1002, "json解析错误")
            }
            return Mapper<T>().map(JSON: dict)!
        }
    }
    
}





