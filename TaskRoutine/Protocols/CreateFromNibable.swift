//
//  UIView+CreateNibable.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/08/09.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit

protocol CreateFromNibable {
    func setup()
}

extension CreateFromNibable where Self:UIView {
    
    func setup() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.className, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        self.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        let bindings = ["view":view]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|",
                                                      options:NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                      metrics:nil,
                                                      views: bindings))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]",
                                                      options:NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                     metrics: nil,
                                                     views: bindings))
    }
}
