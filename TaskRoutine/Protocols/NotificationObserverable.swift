//
//  NotificationObserverable.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/08/09.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit

protocol NotificationObserverable {
    
    var notificationName: Notification.Name { get }
    
    func setNotifObserver()
    func notifObserverAction(type notification: Notification)
}

extension NotificationObserverable where Self : NSObject {
    
    func setNotifObserver() {
        let notif = NotificationCenter.default
        notif.addObserver(forName: notificationName, object: nil, queue: nil) { (notif) in
            self.notifObserverAction(type: notif)
        }
    }
}
