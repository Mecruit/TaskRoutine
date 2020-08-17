//
//  Main_ViewController.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/07/14.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit
import FSCalendar
import RealmSwift

class Main_ViewController: UIViewController {

    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var calendar_heightConst: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var createTaskButton: UIButton!
    
    private let reaml = try! Realm()
    
    private var dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.settingNavigationBar()
        self.settingCalender()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        createTaskButton.layer.cornerRadius = createTaskButton.layer.bounds.width / 2
       
    }
    

    private func settingCalender() {
        calendar.setScope(.week, animated: false)
        for i in 0 ..< 7 {
            calendar.calendarWeekdayView.weekdayLabels[i].text = conf_weekdays[i]
            calendar.headerHeight = 0
        }
    }
    
    
    private func settingNavigationBar() {
        dateFormatter.dateFormat = "M/d"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Medium", size: 28)!]
        navigationController?.navigationBar.enableTransparency()
        self.title = "今日"
    }


    @IBAction func tapCreateButton(_ sender: Any) {
        self.performSegue(segue: .toTaskCreate, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case Segue.toTaskEdit.identifier,
             Segue.toTaskCreate.identifier:
            self.toTaskEditViewContoller(segue: segue, sender: sender as? PRTask)
            break
            
        default:
            break
        }
    }
    
    private func toTaskEditViewContoller(segue: UIStoryboardSegue, sender: PRTask?) {
        let vc = segue.destination as! TaskEdit_ViewController
        
        if sender != nil {
            vc.setTask(task: sender!)
        }
        else {
            let task = PRTask()
            task.taskTime = PRTaskTime()
            task.schedule = PRTaskSchedule()
            task.goal     = PRTaskGoal()
            vc.setTask(task: task)
        }
    }
    
}


// MARK: - UITableViewDataSource
extension Main_ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
        
    }
    
}





// MARK: - UITableViewDelegate
extension Main_ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(segue: .toTaskDetail, sender: nil)
    }
}







// MARK: - FSCalendar DataSource
extension Main_ViewController: FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendar_heightConst.constant = 80.0
        calendar.layoutIfNeeded()
    }
}

// MARK: - FSCalendar Delegate
extension Main_ViewController: FSCalendarDelegate
{
    
}
