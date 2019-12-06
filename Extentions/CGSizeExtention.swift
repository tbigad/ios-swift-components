//
//  CGSizeExtention.swift
//
//  Created by Pavel N on 12/6/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import UIKit

extension CGSize {
    enum AspectRatio {
        case ignore
        case keep
        case keepForExpandind
    }
    
    func scaled(withNewSize size:CGSize, aspectRation mode:AspectRatio) -> CGSize {
        if (mode == AspectRatio.ignore || self.width == 0 || self.height == 0) {
            return size;
        } else {
            var useHeight:Bool;
            let rw:CGFloat = CGFloat(size.height) * CGFloat(self.width) / CGFloat(self.height);

            if (mode == AspectRatio.keep) {
                useHeight = (rw <= size.width);
            } else { // mode == AspectRatio.keepForExpandind
                useHeight = (rw >= size.width);
            }

            if (useHeight) {
                return CGSize(width: rw, height: size.height);
            } else {
                return CGSize(width: size.width,
                              height: CGFloat(CGFloat(size.width) * CGFloat(self.height) / CGFloat(self.width)));
            }
        }
    }
}
