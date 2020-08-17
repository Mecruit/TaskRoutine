//
//  SelectPickerView.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/07/25.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit

class SelectTimerViewController: SemiModal_ViewController,
StoryboardInstantiatable,
NotificationPostable {
        
    private var defaultSelected:[Int]   = [0, 9]
    
    var closeAction: ((_ isSave:Bool, _ selecteds:[Int])->Void)?

    let timesData:[[Int]] = {
        var hour: [Int]    = []
        var minit: [Int]   = []
        for var i in 0..<24 {
            hour.append(i)
        }
        for var i in 0..<60 {
            minit.append(i)
        }
        return [hour,minit]
    }()

    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        self.pickerView.selectRow(defaultSelected[0], inComponent: 0, animated: false)
        self.pickerView.selectRow(defaultSelected[1], inComponent: 1, animated: false)
    }
    
    func setDefault(indexs:[Int]) {
        self.defaultSelected = indexs
    }
    
    
    private func reloadData() {
        self.pickerView.reloadInputViews()
    }
    
    @IBAction func tapSaveButton(_ sender: Any) {
        self.dismiss(animated: true)
        let selecteds = [pickerView.selectedRow(inComponent: 0), pickerView.selectedRow(inComponent: 1)]
        let hourMin =  (hour:selecteds[0], min: selecteds[1])
        postNotificatin(notificationName: .PR_ChangeTimer, object:hourMin)
    }
    
    @IBAction func tapCancelButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension SelectTimerViewController: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return timesData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return timesData[component].count
    }
    
}

extension SelectTimerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(timesData[component][row])
    }
    
}
