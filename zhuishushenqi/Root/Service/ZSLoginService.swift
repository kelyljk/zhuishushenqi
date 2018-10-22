//
//  ZSLoginService.swift
//  zhuishushenqi
//
//  Created by caonongyun on 2018/10/19.
//  Copyright © 2018年 QS. All rights reserved.
//

import UIKit
import HandyJSON
import QSNetwork

class ZSLoginService: NSObject {
    
    func QQLogin(url:String, parameter:[String:Any]?,completion:@escaping ZSBaseCallback<ZSQQLoginResponse>) {
        zs_post(url, parameters: parameter) { (json) in
            if let user = ZSQQLoginResponse.deserialize(from: json) {
                completion(user)
            } else {
                completion(nil)
            }
        }
    }
    
    func WXLogin(url:String, parameter:[String:Any]?,completion:@escaping ZSBaseCallback<ZSQQLoginResponse>) {
        zs_post(url, parameters: parameter) { (json) in
            if let user = ZSQQLoginResponse.deserialize(from: json) {
                completion(user)
            } else {
                completion(nil)
            }
        }
    }

}