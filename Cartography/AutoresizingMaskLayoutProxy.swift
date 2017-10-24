//
//  AutoresizingMaskLayoutProxy.swift
//  Cartography-iOS
//
//  Created by Vitor Travain on 24/10/17.
//  Copyright © 2017 Robert Böhnke. All rights reserved.
//

import Foundation

public protocol AutoresizingMaskLayoutProxy: LayoutProxy {
    var translatesAutoresizingMaskIntoConstraints: Bool { get set }
}
