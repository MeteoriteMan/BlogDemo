//
//  ViewController.swift
//  popover
//
//  Created by 张晨晖 on 2018/3/1.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController ,UIPopoverPresentationControllerDelegate {

    lazy var midPopOverBtn: UIButton = {
        let btn: UIButton = UIButton()
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle("popover", for: .normal)
        btn.addTarget(self, action: #selector(btnPopover), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "popover", style: .plain, target: self, action: #selector(itemPopover))
        view.addSubview(midPopOverBtn)
        midPopOverBtn.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }
    }

    @objc fileprivate func itemPopover() -> Void {
        let popoverController: PopoverViewController = PopoverViewController()
        //1.指定modal展示为popover类型
        popoverController.modalPresentationStyle = .popover
        //2.指定需要popover控制器的popover的代理
        popoverController.popoverPresentationController?.delegate = self
        //3.popover有一个来源视图"souceView",如果是继承与UIView下的那就使用SourceView.
        //如果是继承与UIResponder的UIBarButtonItem那就使用"barButtonItem"
        popoverController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        popoverController.preferredContentSize = popoverController.view.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        self.present(popoverController, animated: true, completion: nil)
    }

    @objc fileprivate func btnPopover() -> Void {
        let popoverController: PopoverViewController = PopoverViewController()
        popoverController.modalPresentationStyle = .popover
        popoverController.popoverPresentationController?.delegate = self
        //如果点击弹出popover不是UIBarbutton类型的话.需要设置sourceView,不然会崩溃
        //不设置sourceRect其实是可以的,但是小尖尖的位置会不对
        popoverController.popoverPresentationController?.sourceView = midPopOverBtn
        //小间间位置
        popoverController.popoverPresentationController?.sourceRect = midPopOverBtn.bounds
        // MARK: 设置popover大小
        popoverController.preferredContentSize = popoverController.view.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        self.present(popoverController, animated: true, completion: nil)
    }

    /// 解除iPhone不能使用popover的限制(如果不设置这个,ipad有popover效果,而iphone没有)
    ///
    /// - Parameter controller: <#controller description#>
    /// - Returns: <#return value description#>
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

