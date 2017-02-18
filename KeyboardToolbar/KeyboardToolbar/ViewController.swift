//
//  ViewController.swift
//  KeyboardToolbar
//
//  Created by Kentarou on 2017/02/18.
//  Copyright © 2017年 Kentarou. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    
}


class TwoColumnPickerTextField: UITextField, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let pickerView = UIPickerView()
    let toolbarHeight: CGFloat = 44
    var dataArray1 = (1965...2017).map{ String($0) + "年" }
    var dataArray2 = (1...12).map{ String($0) + "月" }
    
    var selectYear = ""
    var selectMonth = ""
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override var inputAccessoryView: UIView? {
        get {
            
            let toolBar = UIToolbar()
            toolBar.barStyle = UIBarStyle.default
            toolBar.isTranslucent = true
            toolBar.tintColor = UIColor.black
            let doneButton   = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.donePressed))
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.cancelPressed))
            let spaceButton  = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
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
        self.text = selectYear + " / " + selectMonth
        resignFirstResponder()
    }
    
    // Cancel
    func cancelPressed() {
        print("Cancel!")
        self.text = ""
        resignFirstResponder()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // 表示行
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0 : return dataArray1.count
        case 1 : return dataArray2.count
        default: return 0
        }
    }
    
    // 各ラベルの幅
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.size.width
        
        switch component {
        case 0 : return screenWidth / 2
        case 1 : return screenWidth / 2
        default: return 0
        }
    }
    
    //表示内容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0 : return dataArray1[row]
        case 1 : return dataArray2[row]
        default: return nil
        }
    }
    
    //選択時
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0 : selectYear = dataArray1[row]
        case 1 : selectMonth =  dataArray2[row]
        default: break
        }
    }
}


class PickerViewTextField: UITextField, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let pickerView = UIPickerView()
    let toolbarHeight: CGFloat = 44
    var dataArray = ["楽天", "ソニー", "APPLE", "amazon", "softbank"]
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override var inputAccessoryView: UIView? {
        get {
            
            let toolBar = UIToolbar()
            toolBar.barStyle = UIBarStyle.default
            toolBar.isTranslucent = true
            toolBar.tintColor = UIColor.black
            let doneButton   = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.donePressed))
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.cancelPressed))
            let spaceButton  = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
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


class DatePickerTextField: UITextField {
    
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
            let doneButton   = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.donePressed))
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.cancelPressed))
            let spaceButton  = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
            toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
            toolBar.isUserInteractionEnabled = true
            toolBar.sizeToFit()
            
            return toolBar
        }
        set {}
    }
    
    override var inputView: UIView? {
        get {
            datePicker.frame = CGRect(x: 0, y: 44, width: UIScreen.main.bounds.size.width, height: datePicker.bounds.size.height)
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



class CustomTextField: UITextField {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override var inputAccessoryView: UIView? {
        get {
            let toolBar = UIToolbar()
            toolBar.barStyle = UIBarStyle.default
            toolBar.isTranslucent = true
            toolBar.tintColor = UIColor.black
            let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.donePressed))
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.cancelPressed))
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
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
