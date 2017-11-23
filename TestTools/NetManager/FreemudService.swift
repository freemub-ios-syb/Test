//
//  FreemudService.swift
//  TestTools
//
//  Created by 舒圆波 on 17/11/8.
//  Copyright © 2017年 舒圆波. All rights reserved.
//

import Foundation
import Moya
import RxSwift


enum FreemudService {
    case getNews
}

let FreemudProvider = RxMoyaProvider<FreemudService>(endpointClosure: publicParamEndpointClosure,requestClosure:requestTimeoutClosure,plugins:[logPlugin])
let disposeBag = DisposeBag()

extension FreemudService:TargetType {
    //定义基类ip
    var baseURL: URL {
        return URL(string: "https://iu.snssdk.com")!
    }
    
    //定义各个服务路径
    var path: String {
        switch self {
        case .getNews:
            return "/article/category/get_subscribed/v1/"
        }
    }
    
    //定义请求方式
    var method: Moya.Method {
        switch self {
        case .getNews:
            return .get
        }
    }
    
    //请求参数
    var parameters: [String:Any]? {
        switch self {
        case .getNews:
            return ["iid":"6253487170","iid2":10]
        }
    }
    
    //参数格式
    var parameterEncoding: Moya.ParameterEncoding {
        switch self {
        case .getNews:
            return URLEncoding.default
        }
    }
    
    //测试数据
    var sampleData: Data {
        switch  self {
        case .getNews:
            return "no data".utf8Encoded
        }
    }
    
    //request download upload
    var task: Task {
        switch self {
        case .getNews:
            return .request
        }
    }
}
