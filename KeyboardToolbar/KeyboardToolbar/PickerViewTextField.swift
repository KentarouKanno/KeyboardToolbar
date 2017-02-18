//
//  PickerViewTextField.swift
//  KeyboardToolbar
//
//  Created by Kentarou on 2017/02/18.
//  Copyright © 2017年 Kentarou. All rights reserved.
//

import Foundation
import UIKit

class PickerViewTextField: UITextField, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let pickerView = UIPickerView()
    let toolbarHeight: CGFloat = 44
    var dataArray = ["Google", "Sony", "Apple", "Amazon", "softbank"]
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override var inputAccessoryView: UIView? {
        get {
            
            let toolBar = UIToolbar()
            toolBar.barStyle = UIBarStyle.default
            toolBar.isTranslucent = true
            toolBar.tintColor = UIColor.black
            let doneButton   = UIBarButtonItem(title: "Done",
                                               style: .done, target: self,
                                               action: #selector(self.donePressed))
            let cancelButton = UIBarButtonItem(title: "Cancel",
                                               style: .plain,
                                               target: self,
                                               action: #selector(self.cancelPressed))
            let spaceButton  = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                               target: nil,
                                               action: nil)
            toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
            toolBar.isUserInteractionEnabled = true
            toolBar.sizeToFit()
            
            return toolBar
        }
        set {}
    }
    
    override var inputView: UIView? {
        get {
            pickerView.frame = CGRect(x: 0,
                                      y: toolbarHeight,
                                      width: UIScreen.main.bounds.size.width,
                                      height: pickerView.bounds.size.height)
            pickerView.delegate   = self
            pickerView.dataSource = self
            pickerView.backgroundColor = UIColor.white
            return pickerView
        }
        set {}
    }
    
    // Done
    func donePressed() {
        print("Done!")
        resignFirstResponder()
    }
    
    // Cancel
    func cancelPressed() {
        print("Cancel!")
        self.text = ""
        resignFirstResponder()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataArray[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.text = dataArray[row]
    }
}


