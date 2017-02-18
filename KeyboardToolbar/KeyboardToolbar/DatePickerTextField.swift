//
//  DatePickerTextField.swift
//  KeyboardToolbar
//
//  Created by Kentarou on 2017/02/18.
//  Copyright © 2017年 Kentarou. All rights reserved.
//

import Foundation
import UIKit

class DatePickerTextField: UITextField {
    
    let toolbarHeight: CGFloat = 44
    let datePicker = UIDatePicker()
    var datePickerMode: UIDatePickerMode = .date
    
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
                                               style: .done,
                                               target: self,
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
            datePicker.frame = CGRect(x: 0,
                                      y: toolbarHeight,
                                      width: UIScreen.main.bounds.size.width,
                                      height: datePicker.bounds.size.height)
            datePicker.datePickerMode = datePickerMode
            datePicker.backgroundColor = UIColor.white
            return datePicker
        }
        set {}
    }
    
    func donePressed(){
        print("Done!")
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let dateStr = formatter.string(from: datePicker.date)
        self.text = dateStr
        self.resignFirstResponder()
    }
    
    func cancelPressed(){
        print("Cancel!")
        self.resignFirstResponder()
    }
}


