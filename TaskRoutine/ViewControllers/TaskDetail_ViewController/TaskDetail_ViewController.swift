//
//  TaskDetail_ViewController.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/07/14.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit
import FSCalendar

class TaskDetail_ViewController: UIViewController {


    @IBOutlet weak var edit_Button: UIButton!
    @IBOutlet weak var schedule_Label: UILabel!
    @IBOutlet weak var timer_Label: UILabel!
    @IBOutlet weak var notif_Label: UILabel!
    @IBOutlet weak var calendar: FSCalendar!
    
    @IBOutlet weak var maxStreakValue_Label: UILabel!
    @IBOutlet weak var maxStreakUnit_Label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
