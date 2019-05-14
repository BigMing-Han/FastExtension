//
//  Fast_TabBarController.swift
//  FastExtension
//
//  Created by 韩赛明 on 2019/5/9.
//  Copyright © 2019 杭州小客网络科技有限公司. All rights reserved.
//

import UIKit

class Fast_TabBarController: UITabBarController {

    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: 创建方法
    /// 使用图片数组创建
    ///
    /// - Parameters:
    ///   - controller: Fast_ViewController 类型的控制器
    ///   - title: 图片下方文字
    ///   - images: 图片数组
    ///   - size: 图片大小
    func addViewController(Fast_ViewController controller: Fast_ViewController,Title title:String,Images images:[UIImage],ImageSize size:CGFloat? = 22){
        var image_Array = images
        if image_Array.count > 0{
            image_Array[0] = (image_Array[0].scaleImage(scaleSize: size! / (image_Array[0].size.height)))
            controller.tabBarItem.image = image_Array[0].withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        }
        if image_Array.count > 1{
            image_Array[1] = (image_Array[1].scaleImage(scaleSize: size! / (image_Array[1].size.height)))
            controller.tabBarItem.selectedImage = image_Array[1].withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        }
        controller.tabBarItem.title = title
        self.addChild(controller)
    }
    
    // MARK: UITabBarItem点击事件
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        for (k,v) in (tabBar.items?.enumerated())! {
            if v == item {
                self.animationWithIndex(index: k)
                return
            }
        }
    }
    
    // MARK: UITabBarItem添加动画
    func animationWithIndex(index:Int){
        let tabBarItemsArray : [UITabBarItem]? = getUITabBarItems()
        let tabBarItemLayer = (tabBarItemsArray![index] as AnyObject).layer
        tabBarItemLayer?.animate(type: layerAnimateType.scale, form: 0, to: 1, duration: 0.08, timing: CAMediaTimingFunctionName.easeOut)
    }
    
    
    // MARK: 获取UITabBarItem数组
    func getUITabBarItems() -> [UITabBarItem]?{
        return self.tabBar.items
    }
        
}
