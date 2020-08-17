//
//  TE_SelectIconView.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/08/09.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit

class TE_IconView: ButtonWithLabelView,
NotificationPostable {
    override func tapButton(_ sender: Any) {
        self.postNotificatin(notificationName: .PR_TapSelectIconButton, object: nil)
    }
}
