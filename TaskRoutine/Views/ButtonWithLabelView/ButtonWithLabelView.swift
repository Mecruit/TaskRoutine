//
//  TE_ButtonWithLabel_View.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/08/09.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit

@IBDesignable
class ButtonWithLabelView: UIView, CreateFromNibable  {

// MARK:- --- Properties ---

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var titleNameLabel: UILabel!
    
    @IBInspectable var buttonImage: UIImage? {
        didSet {
            button.setBackgroundImage(buttonImage, for: .normal)
            button.setBackgroundImage(buttonImage, for: .focused)
        }
    }
    
    @IBInspectable var buttonRadius: CGFloat = 0 {
        didSet {
         self.button.layer.cornerRadius = buttonRadius
        }
    }
    
    @IBInspectable var fontSize: CGFloat = UIFont.systemFontSize {
        didSet {
            self.titleNameLabel.font = UIFont.systemFont(ofSize: fontSize)
        }
    }
    @IBInspectable var title: String? {
        didSet {
            titleNameLabel.text = title
        }
    }
    
// MARK:- --- Functions ---
    // コードからの初期化
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        self.initSetting()
    }
    // Storyboard/xib からの初期化
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        self.initSetting()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
        self.initSetting()
    }
    
    private func initSetting() {
        self.backgroundColor = .clear
        setColorTypeNotifObserver()  // protocol "ColorChangeObserverable"
    }
    
    @IBAction func tapButton(_ sender: Any) { }
}

// MARK: - --- Implementation Protocols ---
extension ButtonWithLabelView: ColorChangeObserverable {

    func colorChange(type notification: Notification) {
        let newColor = (notification.object as! ColorType).uiColor()
        resetColor(color: newColor)
    }
    func resetColor(color: UIColor) {
        self.button.tintColor = color
    }
}
