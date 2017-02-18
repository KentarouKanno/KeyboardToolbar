//
//  CustomTextField.swift
//  KeyboardToolbar
//
//  Created by Kentarou on 2017/02/18.
//  Copyright © 2017年 Kentarou. All rights reserved.
//

import Foundation
import UIKit

class CustomTextField: UITextField {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override var inputAccessoryView: UIView? {
        get {
            let toolBar = UIToolbar()
            toolBar.barStyle = .default
            toolBar.isTranslucent = true
            toolBar.tintColor = .black
            let doneButton = UIBarButtonItem(title: "Done", style: .done,
                                             target: self,
                                             action: #selector(self.donePressed))
            let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain,
                                               target: self,
                                               action: #selector(self.cancelPressed))
            let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                              target: nil,
                                              action: nil)
            toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
            toolBar.isUserInteractionEnabled = true
            toolBar.sizeToFit()
            
            return toolBar
        }
        set {}
    }
    
    func donePressed(){
        print("Done!")
        self.resignFirstResponder()
    }
    
    func cancelPressed(){
        print("Cancel!")
        self.resignFirstResponder()
    }
}
