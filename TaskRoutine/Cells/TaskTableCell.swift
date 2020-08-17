//
//  TaskCell_Main.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/07/14.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit


class TaskTableCell: UITableViewCell {

    @IBOutlet weak var wrappingView: UIView!
    @IBOutlet weak var colorLabel: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var spentTimeLabel: UILabel!
    @IBOutlet weak var settingTimeLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        wrappingView.layer.cornerRadius = 5
        wrappingView.clipsToBounds = true
        
        selectionStyle = .none
    }

}
