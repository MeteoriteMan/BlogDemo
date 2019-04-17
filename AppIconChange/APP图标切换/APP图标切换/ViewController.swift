//
//  ViewController.swift
//  APP图标切换
//
//  Created by 张晨晖 on 2018/2/24.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ///交换方法去使系统的APP图标已经改变不弹出
        let firstMethod = class_getInstanceMethod(self.classForCoder,#selector(dy_present(_:animated:completion:)))
        let secondMethod = class_getInstanceMethod(self.classForCoder,#selector(present(_:animated:completion:)))
        method_exchangeImplementations(firstMethod!, secondMethod!)
    }

    @objc dynamic func dy_present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        if viewControllerToPresent.isKind(of: UIAlertController.classForCoder()) {
            print("yes")
        }
    }

    @IBAction func whiteAppIconBtnClick(_ sender: UIButton) {
        if supportAlternateIcons() == true {
            UIApplication.shared.setAlternateIconName(nil, completionHandler:nil)
        }
    }

    @IBAction func redAppIconBtnClick(_ sender: UIButton) {
        if supportAlternateIcons() == true {
            UIApplication.shared.setAlternateIconName("AppIconRed", completionHandler:nil)
        }
    }

    @IBAction func blueAppIconBtnClick(_ sender: UIButton) {
        if supportAlternateIcons() == true {
            UIApplication.shared.setAlternateIconName("AppIconBlue", completionHandler:nil)
        }
    }

    func supportAlternateIcons() -> Bool {///判断是否支持切换应用的APPIcon
        return UIApplication.shared.supportsAlternateIcons
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

