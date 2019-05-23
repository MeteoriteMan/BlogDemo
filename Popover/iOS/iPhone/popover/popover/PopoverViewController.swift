//
//  PopoverViewController.swift
//  popover
//
//  Created by 张晨晖 on 2018/3/1.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

import UIKit

class PopoverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //  MARK: 整个pop的背景色
        self.popoverPresentationController?.backgroundColor = .red
//        self.view.backgroundColor = .red

        // MARK: 设置View约束
        view.snp.makeConstraints { (make) in
            make.height.equalTo(UIScreen.main.bounds.size.height / 3)
            make.width.equalTo(UIScreen.main.bounds.size.width / 3)
        }
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
