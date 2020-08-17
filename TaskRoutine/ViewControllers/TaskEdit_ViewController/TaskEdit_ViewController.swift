//
//  TaskEdit_ViewController.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/07/15.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit
import RealmSwift

class TaskEdit_ViewController: UIViewController {

    fileprivate var task: PRTask = PRTask()
    
    @IBOutlet weak var selectIconButton: TE_IconView!
    @IBOutlet weak var selectColorButton: TE_ColorView!
    @IBOutlet weak var timerView: TE_TimerView!
    
    let realm = try! Realm()
    
    private let notification = NotificationCenter.default
// MARK: - 以下ScrollViewを使用した場合
    override func viewDidLoad() {
        super.viewDidLoad()
        setNotifObserver()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notification.removeObserver(self)
    }
    
    
    private func setNotifObserver() {
        notification.addObserver(self, selector: #selector(keyboardDidHide(_ :)), name: .PR_DidFinishInputName, object: nil)
        notification.addObserver(self, selector: #selector(tapSelectIconButton(_ :)), name: .PR_TapSelectIconButton, object: nil)
        notification.addObserver(self, selector: #selector(tapSelectColorButton(_ :)), name: .PR_TapSelectColorButton, object: nil)
        notification.addObserver(self, selector: #selector(tapShowSelectTimerView(_:)), name: .PR_ShowSelectTimerView, object: nil)
        notification.addObserver(self, selector: #selector(tapTimerOnOffSwitch(_ :)), name: .PR_TapTimerOnOffSwitchButton, object: nil)
        notification.addObserver(self, selector: #selector(tapWeekdayButton(_ :)), name: .PR_TapSelectWeekdayButton, object: nil)
    }
    
    
    func setTask(task: PRTask) {
        self.task = task
    }
    
    @objc func keyboardDidHide(_ notification: Notification) {
    }
    
    // アイコンを設定したら呼ばれる
    @objc func tapSelectIconButton(_ notification: Notification) {
        let selectColorView = createSelectColorView()
        present(selectColorView, animated: true)
    }
    
    // 色を設定したら呼ばれる
    @objc func tapSelectColorButton(_ notification: Notification) {
        let selectColorView = createSelectColorView()
        present(selectColorView, animated: true)
    }
    
    // タイマーを設定するViewを出す & 保存を押したら呼ばれる(クロージャ)
    @objc func tapShowSelectTimerView(_ notification: Notification) {
        let selectTimerView = createSelectTimerView()
        let selectedTime: [Int] = [task.taskTime!.hour, task.taskTime!.min]
        selectTimerView.setDefault(indexs: selectedTime)
        
        selectTimerView.closeAction = {(isSave, selecteds) in
            self.updateTimer(hour: selecteds[0], min: selecteds[1])
        }
        present(selectTimerView, animated: true)
    }

    // タイマーのOnOffスイッチをタップしたら呼ばれる
    @objc func tapTimerOnOffSwitch(_ notification: Notification) {
        self.task.taskTime?.isOn = notification.object as! Bool
    }

    // 曜日の選択をしたら呼ばれる
    @objc func tapWeekdayButton(_ notification: Notification) {
        let button = notification.object as! UIButton
    }
    
//    MARK:- Viewの生成
//   色選択Viewを生成
    fileprivate func createSelectColorView() -> SelectColorViewController {
        let selectColorView = SelectColorViewController.instantiate()
        selectColorView.modalPresentationStyle = .custom
        selectColorView.transitioningDelegate = self
        selectColorView.setDefaultColorName(colorName: task.colorTypeName)
        return selectColorView
    }
//    タイマー設定Viewを生成
    fileprivate func createSelectTimerView() -> SelectTimerViewController {
        let selecTimerView = SelectTimerViewController.instantiate()
        selecTimerView.modalPresentationStyle = .custom
        selecTimerView.transitioningDelegate = self
        return selecTimerView
    }
//    taskのtimerを更新する
    fileprivate func updateTimer(hour: Int, min: Int) {
        var title = ""
        if hour != 0 {
            title = hour.toString() + "時間"
        }
        if min != 0 {
            title += min.toString() + "分"
        }
        task.taskTime?.hour = hour
        task.taskTime?.min = min
        self.timerView.button.setTitle(title, for: .normal)
    }

}

extension TaskEdit_ViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
                return SemiModalView_PresentationController(presentedViewController: presented, presenting: presenting)

    }
}

