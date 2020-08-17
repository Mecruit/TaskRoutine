//
//  UINavigationBar+Transparency.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/07/14.
//  Copyright © 2020 丸山翔. All rights reserved.
//
import UIKit

public extension UINavigationBar {
    /// ナビゲーションバーを透明化する
    func enableTransparency() {
        setBackgroundImage(UIImage(), for: .default)
        shadowImage = UIImage()
    }

    /// ナビゲーションバーを透明化を解除する
    func disableTransparency() {
        setBackgroundImage(nil, for: .default)
        shadowImage = nil
    }
}
