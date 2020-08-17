//
//  PRTask.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/07/17.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit
import RealmSwift

class PRTask: Object {

    @objc dynamic var name: String?
    @objc dynamic var colorTypeName: String = ColorType.pr_Pink.name
    @objc dynamic var taskTime: PRTaskTime?
    @objc dynamic var schedule : PRTaskSchedule?
    @objc dynamic var goal: PRTaskGoal?
    @objc dynamic var isNotif: Bool = false
    @objc dynamic var notifDate: Date?
    
    @objc dynamic var createDate: Date = Date()
    
}
