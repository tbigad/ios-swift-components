//
//  BaseView.swift
//  CnnRssFeed
//
//  Created by Pavel N on 11/27/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import UIKit
//Base class for all Views
class BaseView: UIView {

    // MARK: Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupLayout()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }

    // MARK: Build View hierarchy

    func addSubviews(){
        // add subviews
    }

    func setupLayout(){
        // Autolayout
    }

}
