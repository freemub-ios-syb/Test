//
//  CommonDefine.swift
//  TestTools
//
//  Created by 舒圆波 on 17/11/8.
//  Copyright © 2017年 舒圆波. All rights reserved.
//

import Foundation
import RxSwift
import Moya
let logPlugin = NetworkLoggerPlugin.init(verbose: true, cURL: true, output: {(_ separator: String,_ terminator: String,_ items: Any...) in
    for item in items {
        print("---\((item as! String).replacingOccurrences(of: "\\",with: ""))")
    }
    }, responseDataFormatter: nil)

let publicParamEndpointClosure = { (target: FreemudService) -> Endpoint<FreemudService> in
    let url = target.baseURL.appendingPathComponent(target.path).absoluteString
    let tar = target.parameters
    let targetParam = NSDictionary.init(dictionary: tar!)
    let sign = targetParam.getSignForMd5()
    let endpoint = Endpoint<FreemudService>(url: url, sampleResponseClosure: { .networkResponse(200, target.sampleData) }, method: target.method, parameters: target.parameters, parameterEncoding: target.parameterEncoding)
    return endpoint.adding(newHTTPHeaderFields: ["sign" : "\(sign)"])
}

let requestTimeoutClosure = { (endpoint: Endpoint<FreemudService>, done: @escaping MoyaProvider<FreemudService>.RequestResultClosure) in
    
    guard var request = endpoint.urlRequest else { return }
    
    request.timeoutInterval = 10    //设置请求超时时间
    done(.success(request))
}
