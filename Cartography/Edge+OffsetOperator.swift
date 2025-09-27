//
//  Edge+OffsetOperator.swift
//  Cartography
//
//  Created by Jayson Rhynas on 2023-04-27.
//  Copyright © 2023 Robert Böhnke. All rights reserved.
//

import Foundation

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

precedencegroup OffsetPrecedence {
    higherThan: MultiplicationPrecedence
    associativity: none
}

infix operator |-|: OffsetPrecedence

@available(iOS 10.0, macOS 10.12, tvOS 10.0, *)
extension Edge {
    public static func |-|(lhs: Edge, rhs: Edge) -> Dimension {
        if let first = lhs.xAnchor, let second = rhs.xAnchor {
            return Dimension(lhs.context, first.anchorWithOffset(to: second))
        } else if let first = lhs.yAnchor, let second = rhs.yAnchor {
            return Dimension(lhs.context, first.anchorWithOffset(to: second))
        } else {
            return Dimension(lhs.context, lhs.item, .notAnAttribute)
        }
    }
    
    internal var xAnchor: NSLayoutXAxisAnchor? {
        if attribute == .left, let item = item as? SupportsLeftAnchor {
            return item.leftAnchor
        }
        else if attribute == .right, let item = item as? SupportsRightAnchor {
            return item.rightAnchor
        }
        else if attribute == .leading, let item = item as? SupportsLeadingAnchor {
            return item.leadingAnchor
        }
        else if attribute == .trailing, let item = item as? SupportsTrailingAnchor {
            return item.trailingAnchor
        }
        else if attribute == .centerX, let item = item as? SupportsCenterXAnchor {
            return item.centerXAnchor
        }
        else {
            return nil
        }
    }
    
    internal var yAnchor: NSLayoutYAxisAnchor? {
        if attribute == .top, let item = item as? SupportsTopAnchor {
            return item.topAnchor
        }
        else if attribute == .bottom, let item = item as? SupportsBottomAnchor {
            return item.bottomAnchor
        }
        else if attribute == .centerY, let item = item as? SupportsCenterYAnchor {
            return item.centerYAnchor
        }
        else if attribute == .firstBaseline, let item = item as? SupportsBaselineAnchors {
            return item.firstBaselineAnchor
        }
        else if attribute == .lastBaseline, let item = item as? SupportsBaselineAnchors {
            return item.lastBaselineAnchor
        }
        else {
            return nil
        }
    }
}
