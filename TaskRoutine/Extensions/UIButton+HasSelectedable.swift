//
//  UIButton+isSelected.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/08/08.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit

protocol HasSelectedable {
    
    func switchAction(onAction:@escaping ()->Void,
                      offAction:@escaping ()->Void)
}

extension UIButton: HasSelectedable {
        
    func switchAction(onAction: @escaping () -> Void,
                      offAction: @escaping () -> Void) {
        self.isSelected = !isSelected
        if isSelected {
            onAction()
        } else {
            offAction()
        }
    }
}
