//
//  SelectScheduleViewController.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/08/08.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit

class SelectScheduleViewController: SemiModal_ViewController, StoryboardInstantiatable {

    @IBOutlet weak var stackButtonView: UIStackView!
    
    var closeAction: ( (_ isSave:Bool, _ selectedWeekdays:[Int])->Void )?
    
    var selectedWeekdays: [Int]            = []
//    private var weekdayButtons: [UIButton] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let buttons = createButton()
        setDefaultButtonState(buttons: buttons)
        addButton(buttons: buttons)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }

    
    private func createButton() -> [UIButton] {
        var buttons:[UIButton] = []
        var index = 0
        for weekday in conf_weekdays {
            let button = UIButton()
            button.tag = index
            buttons.append(button)
            button.setTitle(weekday, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
            button.layer.cornerRadius = 10
            button.backgroundColor = ColorType.pr_gray.uiColor()
            button.widthAnchor.constraint(equalToConstant: 46.0).isActive = true
            button.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
            button.addTarget(self, action: #selector(selectedWeekday(sender:)), for: .touchUpInside)
            buttons.append(button)
            index += 1
        }
        return buttons
    }
    
    private func setDefaultButtonState(buttons: [UIButton]) {
        for selectedIndex in selectedWeekdays {
            self.selectedWeekday(sender: buttons[selectedIndex])
        }
    }
    
    private func addButton(buttons: [UIButton]) {
        for button in buttons {
            self.stackButtonView.addArrangedSubview(button)
        }
    }

    
    @objc func selectedWeekday(sender: UIButton) {
        sender.switchAction(onAction: {
            self.selectedWeekdays.append(sender.tag)
            sender.backgroundColor = UIColor.systemPink
        }) {
            self.selectedWeekdays.removeAll(value: sender.tag)
            sender.backgroundColor = ColorType.pr_gray.uiColor()
        }
    }
    
    
    @IBAction func tapCancelButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func tapSaveButton(_ sender: Any) {
        
        
        if let action = closeAction {
            action(true, selectedWeekdays)
        }
        self.dismiss(animated: true)
    }
    
}
