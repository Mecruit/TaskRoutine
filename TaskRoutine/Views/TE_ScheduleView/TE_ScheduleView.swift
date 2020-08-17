//
//  TE_WeekdaySelectView.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/08/09.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit

@IBDesignable
class TE_ScheduleView: UIView,
CreateFromNibable,
NotificationPostable {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var weekdayButtoStackView: UIStackView!
    
    var taskColorType: ColorType = .pr_default
    
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
    
    fileprivate func initSetting() {
        self.setColorTypeNotifObserver()
        setWeekdayButtons(inStackView: weekdayButtoStackView)
    }

    
    
    private func changeButtonColor(button: UIButton, taskColor: UIColor) {
        let color = button.isSelected ? taskColor : ColorType.pr_gray.uiColor()
        button.backgroundColor = color
    }
    
    private func setWeekdayButtons(inStackView: UIStackView) {
        var index = 0
        for weekday in conf_weekdays {
            let button = UIButton()
            button.tag = index
            button.setTitle(weekday, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
            button.layer.cornerRadius = 10
            button.backgroundColor = ColorType.pr_gray.uiColor()
            button.widthAnchor.constraint(equalToConstant: 46.0).isActive = true
            button.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
            button.addTarget(self, action: #selector(tapWeekdayButton(sender:)), for: .touchUpInside)
            weekdayButtoStackView.addArrangedSubview(button)
            index += 1
        }
    }

        
    @objc fileprivate func tapWeekdayButton(sender: UIButton) {
        sender.switchAction(onAction: {
            sender.backgroundColor = self.taskColorType.uiColor()
        }) {
            sender.backgroundColor = ColorType.pr_gray.uiColor()
        }
        postNotificatin(notificationName: .PR_TapSelectWeekdayButton, object: sender)
    }
}

extension TE_ScheduleView: ColorChangeObserverable {
    func colorChange(type notification: Notification) {
        let colorType = notification.object as! ColorType
        self.taskColorType = colorType
        self.resetColor(color: self.taskColorType.uiColor())
    }
    
    
    func resetColor(color: UIColor) {
        iconImageView.tintColor = color
        for view in weekdayButtoStackView.subviews {
            if let button = view as? UIButton {
                self.changeButtonColor(button: button, taskColor: color)
            }
        }
        self.layoutIfNeeded()
    }
}
