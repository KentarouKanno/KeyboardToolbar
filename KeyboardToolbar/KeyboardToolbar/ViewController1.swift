//
//  ViewController1.swift
//  KeyboardToolbar
//
//  Created by Kentarou on 2017/02/18.
//  Copyright © 2017年 Kentarou. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {
    
    @IBOutlet weak var baseViewBottomConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set Notification
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(self.willChangeKeyboard(_:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        notificationCenter.addObserver(self, selector: #selector(self.willHideKeyboard(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        notificationCenter.addObserver(self, selector: #selector(self.willChangeKeyboard(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // WillChange Keyboad
    func willChangeKeyboard(_ notification: Notification) {
        
        if let userInfo = (notification as NSNotification).userInfo {
            if let keyboard = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue,
                let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval {
                
                let keyBoardHeight = keyboard.cgRectValue.height
                self.baseViewBottomConstraint.constant = keyBoardHeight
                
                UIView.animate(withDuration:duration, animations: {
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    
    // WillHide Keyboard
    func willHideKeyboard(_ notification: Notification) {
        
        if let userInfo = (notification as NSNotification).userInfo {
            if let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval {
                
                self.baseViewBottomConstraint.constant = 0
                UIView.animate(withDuration:duration, animations: {
                    self.view.layoutIfNeeded()
                }, completion: { finish in
                    
                })
            }
        }
    }
}
