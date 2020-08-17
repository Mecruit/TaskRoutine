//
//  NotificationPostable.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/08/09.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit

protocol NotificationPostable {
    func postNotificatin(notificationName: Notification.Name, object: Any?)
}

extension NotificationPostable where Self : NSObject {
    
    func postNotificatin(notificationName: Notification.Name, object: Any?) {
        NotificationCenter.default.post(name: notificationName,
                                        object: object)
    }

}
