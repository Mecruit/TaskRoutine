//
//  PRTaskGoal.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/07/20.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit
import RealmSwift

class PRTaskGoal: Object {
    
    @objc dynamic var value: Int = 10
    @objc dynamic var unit: String = "分"
    
}
