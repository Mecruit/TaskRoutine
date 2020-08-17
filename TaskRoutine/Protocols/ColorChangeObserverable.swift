//
//  ColorTypeChangeable.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/08/09.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit

protocol ColorChangeObserverable {
    func setColorTypeNotifObserver()
    func colorChange(type notification: Notification)
    func resetColor(color: UIColor)
}

extension ColorChangeObserverable {

    func setColorTypeNotifObserver() {
        let notif = NotificationCenter.default
        notif.addObserver(forName: .PR_ChangeColor, object: nil, queue: nil) { (notif) in
            self.colorChange(type: notif)
        }
    }
}
