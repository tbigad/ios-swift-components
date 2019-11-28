//
//  BaseViewController.swift
//  CnnRssFeed
//
//  Created by Pavel N on 11/27/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import UIKit
//Base class for all ViewControllers
class BaseViewController<T: BaseView>: UIViewController {

    override func loadView() {
        view = T()
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
}
