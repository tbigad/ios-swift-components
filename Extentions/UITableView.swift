//
//  UITableView.swift
//
//  Created by Pavel Nadolski on 30.12.2021.
//

import UIKit

extension UITableView {
    func sizeHeaderToFit() {
        if let headerView = self.tableHeaderView {
            headerView.setNeedsLayout()
            headerView.layoutIfNeeded()
            let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
            var frame = headerView.frame
            frame.size.height = height
            headerView.frame = frame
            self.tableHeaderView = headerView
        }
    }
    
    func visibleCellsHeight() -> CGFloat {
        var ret:CGFloat = 0
        self.visibleCells.forEach{ ret += $0.bounds.height}
        return ret
    }
}
