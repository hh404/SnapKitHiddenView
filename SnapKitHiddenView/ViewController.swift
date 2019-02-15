//
//  ViewController.swift
//  SnapKitHiddenView
//
//  Created by huangjianwu on 2019/2/15.
//  Copyright © 2019 huangjianwu. All rights reserved.
//

import UIKit
import SnapKit

class CustomView: UIView {
    var label1 = UILabel(frame: .zero)
    var label2 = UILabel(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(label1)
        label1.text = "jkadsjkasdjkjksadjksdajksadjksadsadjkjksadjkdsajksdajksda"
        label1.numberOfLines = 0
        label1.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
        self.addSubview(label2)
//        self.label1.isHidden = true
        label2.numberOfLines = 0
        label2.text = "asdhjsadhsdahsahjhjshjshjsdjhsdajhsdajhsadjhsdajhsadhjsdahjdsahjdsajhsdahjdsahjdsahjsda"
        label2.snp.remakeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            if(label1.isHidden) {
                make.top.equalToSuperview().priority(1000)
                make.top.equalTo(label1.snp.bottom).offset(20).priority(250)
            }
            else {
                make.top.equalToSuperview().priority(250)
                make.top.equalTo(label1.snp.bottom).offset(20).priority(1000)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let v = CustomView(frame: .zero)
        self.view.addSubview(v)
        v.label1.isHidden = true
        v.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(100)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

