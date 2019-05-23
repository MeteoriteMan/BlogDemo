//
//  OldPopoverViewController.swift
//  oldPopover
//
//  Created by 张晨晖 on 2018/3/3.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

import UIKit
import SnapKit

class OldPopoverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //使用SnapKit设置约束
//        view.snp.makeConstraints { (make) in
//            make.width.equalTo(UIScreen.main.bounds.size.width / 5)
//            make.height.equalTo(UIScreen.main.bounds.size.height / 5)
//        }
        //使用
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.width, multiplier: 0, constant: UIScreen.main.bounds.size.width / 5))
        view.addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.height, multiplier: 0, constant: UIScreen.main.bounds.size.height / 5))

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //点击dissmiss掉popover的效果
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
