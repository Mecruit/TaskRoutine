//
//  PRNotifcationName.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/08/09.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit


extension Notification.Name {
    
    static let PR_Blank = Notification.Name("PR_DidFinishInputName")
    
    static let PR_ChangeColor = Notification.Name("PR_ChangeColor")

    static let PR_DidFinishInputName = Notification.Name("PR_DidFinishInputName")
    static let PR_TapSelectIconButton = Notification.Name("PR_TapSelectIconButton")
    static let PR_TapSelectColorButton = Notification.Name("PR_TapSelectColorButton")
    static let PR_ShowSelectTimerView = Notification.Name("PR_ShowSelectTimerView")
    static let PR_TapTimerOnOffSwitchButton = Notification.Name("PR_TapTimerOnOffSwitchButton")
    static let PR_TapSelectWeekdayButton = Notification.Name("PR_TapSelectWeekdayButton")

    static let PR_ChangeTimer = Notification.Name("PR_ChangeTimer")


}
