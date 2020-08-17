//
//  TE_SelectGoalView.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/08/12.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit

class TE_GoalView: UIView, CreateFromNibable {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var onButton: UIButton!
    @IBOutlet weak var offButton: UIButton!
    @IBOutlet weak var goalValueButton: UIButton!
    @IBOutlet weak var goalUnitButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func initSetting() {
        onButton.layer.cornerRadius = 10
        offButton.layer.cornerRadius = 10
        goalValueButton.layer.cornerRadius = 10
        goalUnitButton.layer.cornerRadius = 10
    }

    
    @IBAction func tapOnButton(_ sender: Any) {
    }
    @IBAction func tapOffButton(_ sender: Any) {
    }
    @IBAction func tapValueButton(_ sender: Any) {
    }
    @IBAction func tapUnitButton(_ sender: Any) {
    }
    
    
    
    
    
}

extension TE_GoalView: ColorChangeObserverable {
    func colorChange(type notification: Notification) {
        let color = (notification.object as! ColorType).uiColor()
        self.resetColor(color: color)
    }
    
    func resetColor(color: UIColor) {
        iconImageView.tintColor = color
        onButton.backgroundColor = color
        offButton.backgroundColor = color
        goalValueButton.backgroundColor = color
        goalUnitButton.backgroundColor = color
        
    }
}
