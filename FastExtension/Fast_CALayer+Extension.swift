//
//  Fast_CALayer+Extension.swift
//  FastExtension
//
//  Created by 韩赛明 on 2019/5/9.
//  Copyright © 2019 杭州小客网络科技有限公司. All rights reserved.
//

import UIKit


// MARK: 参考地址 逐步完善! https://www.jianshu.com/p/b943bb89972f
enum layerAnimateType : String {
    case scale     = "transform.scale"    //放大缩小动画
}

//Layer动画
extension CALayer
{
    func animate(type         : layerAnimateType?          = layerAnimateType.scale,
                 form         : Any?                       = nil,
                 to           : Any?                       = nil,
                 duration     : CGFloat?                   = 0,
                 delegate     : CAAnimationDelegate?       = nil,
                 repeatCount  : Float?                     = 0,
                 timing       : CAMediaTimingFunctionName? = CAMediaTimingFunctionName.easeInEaseOut,
                 autoreverses : Bool?                      = false,
                 begin        : CFTimeInterval?            = 0)
    {
        let pulse = CABasicAnimation(keyPath: type?.rawValue)
        if  delegate != nil{
            pulse.delegate = delegate
        }
        pulse.timingFunction = CAMediaTimingFunction.init(name: timing!)
        pulse.duration = CFTimeInterval(duration!)
        if  form         != nil{ pulse.fromValue    = form}
        if  to           != nil{ pulse.toValue      = to}
        if  repeatCount  != nil{ pulse.repeatCount  = repeatCount!}
        if  autoreverses != nil{ pulse.autoreverses = autoreverses!}
        if  begin        != nil{ pulse.beginTime    = begin!}
        pulse.fillMode = .forwards
        self.add(pulse, forKey: nil)
    }
    
    
}
