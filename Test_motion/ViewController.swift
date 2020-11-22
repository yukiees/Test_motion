//
//  ViewController.swift
//  Test_motion
//
//  Created by 松島優希 on 2020/11/22.
//


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateField: UITextField!

        let datePicker = UIDatePicker()

        override func viewDidLoad() {
            super.viewDidLoad()

            createDatePicker()
        }

       func createDatePicker(){

            // DatePickerModeをDate(日付)に設定
            datePicker.datePickerMode = .date

            // DatePickerを日本語化
            datePicker.locale = NSLocale(localeIdentifier: "ja_JP") as Locale

            // textFieldのinputViewにdatepickerを設定
            dateField.inputView = datePicker
            
            // モーションをくるくるに設定
            datePicker.preferredDatePickerStyle = .wheels

            // UIToolbarを設定
            let toolbar = UIToolbar()
            toolbar.sizeToFit()

            // Doneボタンを設定(押下時doneClickedが起動)
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneClicked))

            // Doneボタンを追加
            toolbar.setItems([doneButton], animated: true)

            // FieldにToolbarを追加
            dateField.inputAccessoryView = toolbar
        }

        @objc func doneClicked(){
            let dateFormatter = DateFormatter()

            // 持ってくるデータのフォーマットを設定
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            dateFormatter.locale    = NSLocale(localeIdentifier: "ja_JP") as Locale?
            dateFormatter.dateStyle = DateFormatter.Style.medium
            dateFormatter.dateFormat  = "yyyy年MM月dd日";
            
            // textFieldに選択した日付を代入
            dateField.text = dateFormatter.string(from: datePicker.date)

            // キーボードを閉じる
            self.view.endEditing(true)
        }
}

