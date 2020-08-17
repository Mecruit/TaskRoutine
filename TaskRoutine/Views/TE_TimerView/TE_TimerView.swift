//
//  TE_TimerView.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/08/09.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit

@IBDesignable
class TE_TimerView: UIView, CreateFromNibable,
NotificationPostable {

// MARK:- --- Properties ---
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var timerSwitch: UISwitch!

    var buttonTextColor: UIColor = .darkText
    
// MARK:- --- Functions ---
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        initSetting()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        initSetting()
    }
    
    func initSetting() {
        setColorTypeNotifObserver()
        let notifCenter = NotificationCenter.default
        notifCenter.addObserver(self, selector: #selector(observeAction(_ :)), name: .PR_ChangeTimer, object: nil)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    }
    

    
    @objc func observeAction(_ notif: Notification) {
        let hhMM = notif.object as! (hour: Int, min: Int)
        setButtonText(hour: hhMM.hour, min: hhMM.min)
    }
    
    private func setButtonText(hour: Int, min: Int) {
        var title = ""
        if hour != 0 {
            title = hour.toString() + "時間"
        }
        if min != 0 {
            title += min.toString() + "分"
        }
        self.button.setTitle(title, for: .normal)
        self.layoutIfNeeded()
    }
    
    @IBAction func tapTimerSwitch(_ sender: UISwitch) {
        postNotificatin(notificationName: .PR_TapTimerOnOffSwitchButton, object: sender.isOn)
        button.isEnabled = sender.isOn
    }
    
    
    @IBAction func tapButton(_ sender: Any) {
        postNotificatin(notificationName: .PR_ShowSelectTimerView, object: nil)
    }
}


extension TE_TimerView: ColorChangeObserverable {
    
    func colorChange(type notification: Notification) {
        let colorType = notification.object as! ColorType
        self.resetColor(color: colorType.uiColor())
    }
    
    func resetColor(color: UIColor) {
        button.tintColor = color
        timerSwitch.onTintColor = color
        timerSwitch.tintColor   = color
        iconImageView.tintColor = color
    }
    
}

