//
//  NSObject.swift
//  HeartRateMonitor
//
//  Created by Pavel Nadolski on 15.12.2021.
//

import Foundation

extension NSObject {
    static func describing() -> String {
        return String(describing: Self.self)
    }
}
