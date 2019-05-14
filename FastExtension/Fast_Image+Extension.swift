//
//  Fast_Image+Extension.swift
//  FastExtension
//
//  Created by 韩赛明 on 2019/5/9.
//  Copyright © 2019 杭州小客网络科技有限公司. All rights reserved.
//

import UIKit

//关于图片的所有扩展方法

extension UIImage {
    
    /// 等比率缩放
    ///
    /// - Parameter scaleSize: 缩放比
    /// - Returns: 执行 reSizeImage() 返回 UIImage
    public func scaleImage(scaleSize:CGFloat)->UIImage {
        let reSize = CGSize(width:self.size.width * scaleSize, height:self.size.height * scaleSize)
        return reSizeImage(reSize: reSize)
    }
    
    /// 重设图片大小
    ///
    /// - Parameter reSize: CGSize
    /// - Returns: 返回 UIImage
    public func reSizeImage(reSize:CGSize)->UIImage {
        UIGraphicsBeginImageContextWithOptions(reSize,false,UIScreen.main.scale)
        self.draw(in: CGRect(x:0.0, y:0.0, width:reSize.width, height:reSize.height))
        let reSizeImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return reSizeImage
    }
    
}
