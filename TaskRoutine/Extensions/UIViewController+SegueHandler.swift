//
//  UIViewController+SegueHandler.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/07/19.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit

protocol SegueType {
    var identifier: String { get }
}
extension SegueType where Self: RawRepresentable, Self.RawValue == String {
    var identifier: String {
        return self.rawValue
    }
}

extension UIViewController {
    
    func performSegue(segue : Segue, sender: Any?) {
        self.performSegue(withIdentifier: segue.identifier, sender: sender)
    }
}
