//
//  SemiModal_ViewController.swift
//  ProjectRoutine
//
//  Created by 丸山翔 on 2020/07/25.
//  Copyright © 2020 丸山翔. All rights reserved.
//

import UIKit
protocol SemiModalViewDataSource {
    
}
protocol SemiModalViewDelegate {
    func modalView(_ dismissalTransitionDidEnd: SemiModal_ViewController)
}

class SemiModal_ViewController: UIViewController {
    

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commingInit()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func commingInit() {
        modalPresentationStyle = .custom
    }

}



// ModalViewの大きさやアニメーション、機能の設定をする
class SemiModalView_PresentationController: UIPresentationController {
    
    var overlayView = UIView()
    
    // 表示される直前に呼ばれる
    override func presentationTransitionWillBegin() {
        guard self.containerView != nil else {
            return
        }
        
        overlayView.frame = containerView!.frame
        overlayView.gestureRecognizers = [UITapGestureRecognizer(target: self, action: #selector(tapGestureAction(_:)))]
        overlayView.backgroundColor = .black
        overlayView.alpha = 0
        containerView?.insertSubview(overlayView, at: 0)
        
        self.showTransition(view: overlayView)
    }
    
    // １：表示時のアニメーションを追加し表示する
    private func showTransition(view: UIView) {
        // 遷移アニメーションの設定
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { [weak self] context in
            self?.overlayView.alpha = 0.7
        }, completion: nil)
    }
    
    
    // ２：非表示の直前に呼ばれ、非表示のアニメーションを追加する
    override func dismissalTransitionWillBegin() {
        presentingViewController.transitionCoordinator?.animate(alongsideTransition: {[weak self] context in
            self?.overlayView.alpha = 0.0
        }, completion: nil)
    }
    
    // ３：非表示の終了時に呼ばれる
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            overlayView.removeFromSuperview()
        }
    }
    
    @objc func tapGestureAction(_ sender: UITapGestureRecognizer) {
        presentingViewController.dismiss(animated: true, completion: nil)
    }
    
    
//    let margin = (x: CGFloat(30), y: CGFloat(220.0))
    // 子のコンテナサイズを返す
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: parentSize.width, height: 300)
    }

    // 呼び出し先のView Controllerのframeを返す
    override var frameOfPresentedViewInContainerView: CGRect {
        var presentedViewFrame = CGRect()
        let containerBounds = containerView!.bounds
        let childContentSize = size(forChildContentContainer: presentedViewController, withParentContainerSize: containerBounds.size)
        presentedViewFrame.size = childContentSize
        presentedViewFrame.origin.x = 0
        presentedViewFrame.origin.y = (self.containerView?.frame.height)! - 300.0

        return presentedViewFrame
    }

    // レイアウト開始前に呼ばれる
    override func containerViewWillLayoutSubviews() {
        overlayView.frame = containerView!.bounds
        presentedView?.frame = frameOfPresentedViewInContainerView
        presentedView?.layer.cornerRadius = 10
        presentedView?.clipsToBounds = true
    }

    // レイアウト開始後に呼ばれる
    override func containerViewDidLayoutSubviews() {
    }
}


