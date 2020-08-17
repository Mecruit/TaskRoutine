//
//  PRTaskTime.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/07/19.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit
import RealmSwift

class PRTaskTime: Object {
    
    @objc dynamic var min  : Int = 10
    @objc dynamic var hour  : Int = 0
    
    @objc dynamic var isOn: Bool = true
}
