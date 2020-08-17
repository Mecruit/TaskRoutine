//
//  NSObject+GetClassName.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/08/08.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit

public protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtocol {
    static var className: String {
        String(describing: self)
    }

    var className: String {
        Self.className
    }
}

extension NSObject: ClassNameProtocol {}
