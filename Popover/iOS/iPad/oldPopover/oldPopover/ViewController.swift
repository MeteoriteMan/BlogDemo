//
//  ViewController.swift
//  oldPopover
//
//  Created by 张晨晖 on 2018/3/3.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIPopoverControllerDelegate {

    /// UIBarButtonItem
    @IBOutlet weak var popBarButtonItem: UIBarButtonItem!

    /// UIButton
    @IBOutlet weak var popButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        title = "Popover Test"

    }

    /// PopBarButtonItem点击
    ///
    /// - Parameter sender: UIBarButtonItem
    @IBAction func popBarButtonItemClick(_ sender: UIBarButtonItem) {
        let vc: OldPopoverViewController = OldPopoverViewController()
        let popoverVc: UIPopoverController = UIPopoverController(contentViewController: vc)
        //
        popoverVc.delegate = self
        //设置popover背景色(包括了小三角)
        popoverVc.backgroundColor = .red
        //使vc的size(View)使用Layout布局
        vc.preferredContentSize = vc.view.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        //设置popover的size(内容视图大小,绑定于Vc)
        popoverVc.contentSize = vc.preferredContentSize
        //present出popver.从tabbarItem上谈出来.小三角的方向为任何方向
        popoverVc.present(from: sender, permittedArrowDirections: UIPopoverArrowDirection.any, animated: true)
    }

    /// PopButton点击
    ///
    /// - Parameter sender: UIButton
    @IBAction func popButtonClick(_ sender: UIButton) {//这个没有设置视图的大小.
        let vc: OldPopoverViewController = OldPopoverViewController()
        let popoverVc: UIPopoverController = UIPopoverController(contentViewController: vc)
        popoverVc.delegate = self
        //小三角向右,也就是popover向左弹出
        popoverVc.present(from: sender.bounds, in: sender, permittedArrowDirections: UIPopoverArrowDirection.right, animated: true)
    }

    // Mark: delegate


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

