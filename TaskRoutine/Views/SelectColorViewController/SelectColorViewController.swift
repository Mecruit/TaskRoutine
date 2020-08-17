//
//  SelectColorViewController.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/08/08.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit

class SelectColorViewController: UIViewController, StoryboardInstantiatable, ColorChangePostable {

    @IBOutlet weak var stackButtonView: UIStackView!
    private var selectedColorName: String = ColorType.pr_Pink.name
    private var defaultColorName: String = ColorType.pr_Pink.name
    private var isSelect: Bool = false
    
    
    var closeAction: ((_ isSave:Bool, _ selectColorName:String)->Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        addButton()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }
    
    func setDefaultColorName(colorName: String) {
        self.defaultColorName = colorName
    }
    
    private func addButton() {
        for color in PR_systemColors {
            let button = ColorButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50), color:color)
            button.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
            button.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
            button.addTarget(self, action: #selector(selectedColorButton(_:)), for: .touchUpInside)
            self.stackButtonView.addArrangedSubview(button)
        }
    }
    
    @objc func selectedColorButton(_ sender: ColorButton) {
        self.postChangeColorNotif(colorType: sender.circleColor)
        self.dismiss(animated: true)
    }
}
