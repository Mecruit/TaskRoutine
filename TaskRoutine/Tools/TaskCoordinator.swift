//
//  TaskCoordinator.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/08/08.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit

struct WeekdayFormatter {
    
    
    func getWeekdayString(fromWeekday Index: Int) -> String {
        return conf_weekdays[Index]
    }
    func getWeekdayIndex(fromWeekday Strging: String) -> Int {
        return conf_weekdays.firstIndex(of: Strging) ?? 999
    }
    func getStrings(schedule: PRTaskSchedule) -> String {
        var text = ""
        if schedule.isSunday    { text += "日"}
        if schedule.isMonday    { text += "月"}
        if schedule.isTuesday   { text += "火"}
        if schedule.isWednesday { text += "水"}
        if schedule.isThursday  { text += "木"}
        if schedule.isFriday    { text += "金"}
        if schedule.isSaturday  { text += "土"}
        return text
    }
}

class TaskCoordinator: NSObject {
    
    func updateTaskSchedule(onScheduleWeekdays:[Int],
                            taskSchedule:PRTaskSchedule) -> PRTaskSchedule {
        
        let reTaskSchedule = resetTaskSchedule(taskSchedule: taskSchedule)
        for weekday in onScheduleWeekdays {
            switch weekday {
            case 0: reTaskSchedule.isSunday = true    // 日曜日
            case 1: reTaskSchedule.isMonday = true    // 月曜日
            case 2: reTaskSchedule.isTuesday = true   // 火曜日
            case 3: reTaskSchedule.isWednesday = true // 水曜日
            case 4: reTaskSchedule.isThursday = true  // 木曜日
            case 5: reTaskSchedule.isFriday = true  // 金曜日
            case 6: reTaskSchedule.isSaturday = true  // 土曜日
            default: break
            }
        }
        return reTaskSchedule
    }
    
    func resetTaskSchedule(taskSchedule: PRTaskSchedule) -> PRTaskSchedule {
        taskSchedule.isSunday    = false    // 日曜日
        taskSchedule.isMonday    = false    // 月曜日
        taskSchedule.isTuesday   = false   // 火曜日
        taskSchedule.isWednesday = false // 水曜日
        taskSchedule.isThursday  = false  // 木曜日
        taskSchedule.isThursday  = false  // 金曜日
        taskSchedule.isThursday  = false  // 土曜日
        return taskSchedule
    }
}
