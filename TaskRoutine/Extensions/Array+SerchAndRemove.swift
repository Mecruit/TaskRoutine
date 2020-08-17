//
//  Array+SerchAndRemove.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/08/08.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit

extension Array where Element: Equatable {
    mutating func removeAll(value: Element) {
        while let i = self.firstIndex(of: value) {
            self.remove(at: i)
        }
    }
}
