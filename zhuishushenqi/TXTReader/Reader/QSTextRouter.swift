//
//  QSTextRouter.swift
//  zhuishushenqi
//
//  Created by Nory Cao on 2017/4/14.
//  Copyright © 2017年 QS. All rights reserved.
//

import Foundation
import UIKit

typealias QSTextCallBack = (_ book:BookDetail)->Void
class QSTextRouter: QSTextWireframeProtocol {

    weak var viewController: UIViewController?
    
    static func createModule(bookDetail:BookDetail,callback:@escaping QSTextCallBack) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = ZSReaderViewController()
        view.viewModel.book = bookDetail
        
        return view
    }
    
    func presentDetails(_ novel: QSRankModel) {
        viewController?.navigationController?.pushViewController(QSRankDetailRouter.createModule(novel:novel), animated: true)
    }
    
    func presentCategory(book:BookDetail,books:[String:Any]){
        let vc:QSCategoryReaderViewController = QSCategoryRouter.createModule(book: book) as! QSCategoryReaderViewController
        let txtVC:QSTextReaderController = viewController as! QSTextReaderController
//        vc.categoryDelegate = txtVC
        vc.bookDetail = book
//        vc.chapterDict = 
        let nav = UINavigationController(rootViewController: vc)
        viewController?.present(nav, animated: true, completion: nil)
    }
}
