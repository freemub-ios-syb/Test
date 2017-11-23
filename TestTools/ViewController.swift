//
//  ViewController.swift
//  TestTools
//
//  Created by 舒圆波 on 17/11/7.
//  Copyright © 2017年 舒圆波. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {

    @IBOutlet var UserName: UITextField!
    @IBOutlet var Img1: UIImageView!
    @IBOutlet var ImgRT: UIImageView!
    @IBOutlet var ImgLB: UIImageView!
    @IBOutlet var ImgRB: UIImageView!
    private let keySecret:String = "FREEMUDSECRET"
    public let toOutStr = "fsf"
    @IBOutlet var ImgCT: UIImageView!
    let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    let unControlAnim = CABasicAnimation(keyPath: "position")
    var value: NSValue?
    var imgCTAnim:CABasicAnimation!
    var imgRTAnim:CABasicAnimation!
    var imgRBAnim:CABasicAnimation!
    var imgLBAnim:CABasicAnimation!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let reqDic:NSDictionary = ["name":"hello","age":10,"isBoy":true,"home":"上海","money":10.2,"Time":"2017-10-29"]
//       
//        
//        let signStr =  reqDic.getSignForMd5()
//        print("---\(signStr)")
        view.backgroundColor = UIColor.blue
       let fromLeftTransAnim = CABasicAnimation(keyPath: "position.x")
        fromLeftTransAnim.fromValue = -view.bounds.size.width
        fromLeftTransAnim.toValue = (view.bounds.size.width-300)/2
        fromLeftTransAnim.duration = 2
        fromLeftTransAnim.fillMode = kCAFillModeBoth
        UserName.layer.add(fromLeftTransAnim, forKey: "")
        
        
//        unControlAnim.fromValue = -40
//        unControlAnim.toValue = CGPoint(x: CGFloat(arc4random_uniform(UInt32(SCREEN_WIDTH))), y: CGFloat(arc4random_uniform(UInt32(SCREEN_HEIGHT))))
        
        
        
//        value = getRandomPoint()
//        unControlAnim.toValue = value
//        unControlAnim.duration = 3
//        unControlAnim.fillMode = kCAFillModeBackwards
//        unControlAnim.delegate = self
//        unControlAnim.setValue("img", forKey: "name")
//        unControlAnim.setValue(Img1.layer, forKey: "layer")
//        Img1.layer.add(unControlAnim, forKey: "flow")
//        
//        imgCTAnim = getRandomTransAnim()
//        imgCTAnim.setValue("ct", forKey: "name")
//        imgCTAnim.toValue = getRandomPoint()
//        imgCTAnim.setValue(ImgCT.layer, forKey: "layer")
//        ImgCT.layer.add(imgCTAnim, forKey: "")
//        
//        imgRTAnim = getRandomTransAnim()
//        imgRTAnim.setValue("rt", forKey: "name")
//        imgRTAnim.toValue = getRandomPoint()
//        imgRTAnim.setValue(ImgRT.layer, forKey: "layer")
//        ImgRT.layer.add(imgRTAnim, forKey: "")
//
//        imgLBAnim = getRandomTransAnim()
//        imgLBAnim.setValue("lb", forKey: "name")
//        imgLBAnim.toValue = getRandomPoint()
//        imgLBAnim.setValue(ImgLB.layer, forKey: "layer")
//        ImgLB.layer.add(imgLBAnim, forKey: "")
//
//        imgRBAnim = getRandomTransAnim()
//        imgRBAnim.setValue("rb", forKey: "name")
//        imgRBAnim.toValue = getRandomPoint()
//        imgRBAnim.setValue(ImgRB.layer, forKey: "layer")
//        ImgRB.layer.add(imgRBAnim, forKey: "")
//        FreemudProvider.request(.getNews).retry(5)
//        .mapObject(type: CommonNetError.self)
//            .subscribe(onNext: {(response: CommonNetError) in
//                    print("---收到response")
//                }, onError: {error in
//                    if let moyaError = error as? RxSwiftMoyaError{
//                         print("---错误\(moyaError.description)")
//                    } else {
//                        print("---非moya错误\(error.localizedDescription)")
//                    }
//                }, onCompleted: {
//                    print("---请求完成")
//                }, onDisposed: {
//                    print("---onDispose完成")
//            })
//            .addDisposableTo(disposeBag)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 20,delay:0,options:[.curveEaseInOut], animations: {
            var frame = self.Img1.frame
            frame.origin = CGPoint(x: 200, y: 300)
            self.Img1.frame = frame
            
            },completion: {(bool) in
                
        })
        
        
    }

    func getRandomPoint() -> NSValue {
        let value = NSValue(cgPoint: CGPoint(x: CGFloat(arc4random_uniform(UInt32(SCREEN_WIDTH-30))), y: CGFloat(arc4random_uniform(UInt32(SCREEN_HEIGHT-60)))))
        return value
    }
    
    func getRandomTransAnim() -> CABasicAnimation {
        let anim = CABasicAnimation(keyPath: "position")
        anim.toValue = value
        anim.duration = 3
        anim.fillMode = kCAFillModeBackwards
        anim.delegate = self
        return anim
    }
    
    func getRandomTransAnim2() -> CGAffineTransform {
        return CGAffineTransform(translationX: CGFloat(arc4random_uniform(UInt32(SCREEN_WIDTH))), y: CGFloat(arc4random_uniform(UInt32(SCREEN_HEIGHT-100))))
    }
    
}
extension ViewController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if let animName = anim.value(forKey: "name") as? String{
            
            if animName == "img"{
               let layer = anim.value(forKey: "layer") as? CALayer
                unControlAnim.fromValue = unControlAnim.toValue
                unControlAnim.toValue = getRandomPoint()
                layer?.add(unControlAnim, forKey: nil)
            }
            if animName == "ct" {
                let layer = anim.value(forKey: "layer") as? CALayer
                imgCTAnim.fromValue = imgCTAnim.toValue
                imgCTAnim.toValue = getRandomPoint()
                layer?.add(imgCTAnim, forKey: nil)
            }
            if animName == "rt" {
                let layer = anim.value(forKey: "layer") as? CALayer
                imgRTAnim.fromValue = imgRTAnim.toValue
                imgRTAnim.toValue = getRandomPoint()
                layer?.add(imgRTAnim, forKey: nil)
            }
            if animName == "rb" {
                let layer = anim.value(forKey: "layer") as? CALayer
                imgRBAnim.fromValue = imgRBAnim.toValue
                imgRBAnim.toValue = getRandomPoint()
                layer?.add(imgRBAnim, forKey: nil)
            }
            if animName == "lb" {
                let layer = anim.value(forKey: "layer") as? CALayer
                imgLBAnim.fromValue = imgLBAnim.toValue
                imgLBAnim.toValue = getRandomPoint()
                layer?.add(imgLBAnim, forKey: nil)
            }
        }
    }
}




