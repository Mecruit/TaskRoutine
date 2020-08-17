//
//  ColorChangePostable.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/08/09.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit

protocol ColorChangePostable {
    func postChangeColorNotif(colorType: ColorType)
}

extension ColorChangePostable {
    func postChangeColorNotif(colorType: ColorType) {
        NotificationCenter.default.post(name: Notification.Name.PR_ChangeColor,
                                        object: colorType)
    }
}
