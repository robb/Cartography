//
//  LayoutProxy.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

public class LayoutProxy {
    public var width: Dimension { return Dimension.Width(self) }
    public var height: Dimension { return Dimension.Height(self) }

    public var size: Size { return Size.Size(self) }

    public var top: Edge { return Edge.Top(self) }
    public var right: Edge { return Edge.Right(self) }
    public var bottom: Edge { return Edge.Bottom(self) }
    public var left: Edge { return Edge.Left(self) }

    public var edges: Edges { return Edges.Edges(self) }

    public var leading: Edge { return Edge.Leading(self) }
    public var trailing: Edge { return Edge.Trailing(self) }

    public var centerX: Edge { return Edge.CenterX(self) }
    public var centerY: Edge { return Edge.CenterY(self) }
    public var center: Point { return Point.Center(self) }

    public var baseline: Edge { return Edge.Baseline(self) }

    let view: View

    public var superview: LayoutProxy? {
        if let superview = view.superview {
            return LayoutProxy(superview)
        } else {
            return nil
        }
    }

    init(_ view: View) {
        self.view = view
    }

    func apply(from: Property, coefficients: Coefficients = Coefficients(), to: Property? = nil, relation: NSLayoutRelation = NSLayoutRelation.Equal) -> NSLayoutConstraint {
        from.view.car_setTranslatesAutoresizingMaskIntoConstraints(false)

        let superview = commonSuperview(from.view, to?.view)

        var toAttribute: NSLayoutAttribute! = NSLayoutAttribute.NotAnAttribute

        if to == nil {
            toAttribute = NSLayoutAttribute.NotAnAttribute
        } else {
            toAttribute = to!.attribute
        }

        let constraint = NSLayoutConstraint(item: from.view,
            attribute: from.attribute,
            relatedBy: relation,
            toItem: to?.view,
            attribute: toAttribute,
            multiplier: CGFloat(coefficients.multiplier),
            constant: CGFloat(coefficients.constant))

        superview?.addConstraint(constraint)

        return constraint
    }
}

private func commonSuperview(a: View, b: View?) -> View? {
    if (b == nil) {
        return a;
    } else if (a.superview == b) {
        return b;
    } else if (a == b!.superview) {
        return a;
    } else if (a.superview == b!.superview) {
        return a.superview;
    } else {
        let superviews = NSMutableSet()

        var view: View? = a
        while let superview = view?.superview {
            superviews.addObject(superview)

            view = superview
        }

        view = b
        while let superview = view?.superview {
            if superviews.containsObject(superview) {
                return superview
            }

            view = superview
        }

        return nil
    }
}
