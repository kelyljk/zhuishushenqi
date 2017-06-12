//
//  QSLastIntroduceCell.swift
//  zhuishushenqi
//
//  Created by caonongyun on 2017/6/11.
//  Copyright © 2017年 QS. All rights reserved.
//

import UIKit

typealias Completion = ()->Void

class QSLastIntroduceCell: UITableViewCell {

    var sinaLogin:Completion?
    var qqLoginAction:Completion?
    var noAccountCompletion:Completion?
    
    @IBAction func weiboLogin(_ sender: Any) {
        if let sina = sinaLogin {
            sina()
        }
    }
    
    @IBAction func qqLogin(_ sender: Any) {
        if let qq = qqLoginAction {
            qq()
        }
    }
    
    var noAccount: UIButton?
    @IBOutlet weak var qqLoginBtn: UIButton!
    @IBOutlet weak var sinaLoginBtn: UIButton!
    
    func noAccountAction(_ sender: Any) {
        if let noAcc = noAccountCompletion {
            noAcc()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        QSLog(noAccount.frame)
//        (102.0, 451.0, 118.0, 30.0)
        noAccount = UIButton(frame: CGRect(x: 102, y: self.qqLoginBtn.frame.maxY + 44, width: 118, height: 30))
        let dict = [NSUnderlineStyleAttributeName:1,NSFontAttributeName:UIFont.systemFont(ofSize: 15)] as [String : Any]
        let attr = NSMutableAttributedString(string: "没有帐号怎么办?", attributes: dict)
        noAccount?.setAttributedTitle(attr, for: .normal)
        noAccount?.titleLabel?.textAlignment = .center
        noAccount?.titleLabel?.textColor = UIColor.white
        noAccount?.addTarget(self, action: #selector(noAccountAction(_:)), for: .touchUpInside)
        contentView.addSubview(noAccount!)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

class QSLoginButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView?.frame = CGRect(x: 15, y: 11, width: 20, height: 20)
//        NSUnderlineStyle.styleSingle
    }
}
