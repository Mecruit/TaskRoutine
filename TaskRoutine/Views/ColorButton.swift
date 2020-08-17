//
//  ColorButton.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/07/22.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit

@IBDesignable
class ColorButton: UIButton {
    
    private var circleView: UIView = UIView()
    
    var circleColor: ColorType = ColorType.pr_Pink {
        didSet { circleView.backgroundColor = circleColor.uiColor() }
    }
    @IBInspectable var circleSize: Int = 10
    
    @IBInspectable var cornerRadius: Float = 10
    
    @IBInspectable var highlightColor: UIColor = UIColor.red

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(frame: CGRect, color: ColorType) {
        super.init(frame: frame)
        self.circleColor = color
        self.setBackgroundColor(color: .gray, forState: .highlighted)
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // 円
        let circle = UIBezierPath(arcCenter: CGPoint(x: self.frame.width / 2, y: self.frame.height / 2),
                                  radius: 10,
                                  startAngle: 0,
                                  endAngle: CGFloat(Double.pi)*2,
                                  clockwise: true)
        // 内側の色
        circleColor.uiColor().setFill()
        // 内側を塗りつぶす
        circle.fill()

        // 線を塗りつぶす
        circle.stroke()
    }
    
    
    func setBackgroundColor(color: UIColor, forState: UIControl.State) {
       UIGraphicsBeginImageContext(self.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        context.setFillColor(color.cgColor)
        context.fill(self.frame)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(image, for: forState)
    }
    
}
