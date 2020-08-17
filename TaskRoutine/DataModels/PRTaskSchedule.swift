//
//  PRTaskSchedule.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/08/08.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit
import RealmSwift

class PRTaskSchedule: Object {
    
    @objc dynamic var isSunday: Bool = false
    @objc dynamic var isMonday: Bool = false
    @objc dynamic var isTuesday: Bool = false
    @objc dynamic var isWednesday: Bool = false
    @objc dynamic var isThursday: Bool = false
    @objc dynamic var isFriday: Bool = false
    @objc dynamic var isSaturday: Bool = false

    @objc dynamic var date: Date?
}
