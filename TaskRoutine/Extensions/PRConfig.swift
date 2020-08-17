//
//  PRConfig.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/07/19.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit

let PR_systemColors = [
    ColorType.pr_Pink,
    ColorType.pr_Orange,
    ColorType.pr_Yellow,
]

enum Segue: String, SegueType {
    case toTaskCreate
    case toTaskEdit
    case toTaskDetail
}

enum Cell_Identifiers: String {
    var identifier: String {
        return self.rawValue
    }
    
    case Edit_Name
    case Edit_Color
    case Edit_Timer
    case Edit_Schedule
    case Edit_Goal
    case Edit_Notif
}

protocol GettableName {
    var name: String { get }
}

enum ColorType: String, GettableName {
    var name: String {
        return self.rawValue
    }
    case pr_default
    case pr_gray
    case pr_Pink
    case pr_Orange
    case pr_Yellow
    
    func uiColor() -> UIColor {
        return UIColor(named: self.name)!
    }
}

var conf_timerDatas:[String] {
    get {
        var datas:[String] = []
        for i in 1..<60 {
            datas.append(String(i))
        }
        return datas
    }
}
let conf_weekdays = ["日","月","火","水","木","金","土"]

