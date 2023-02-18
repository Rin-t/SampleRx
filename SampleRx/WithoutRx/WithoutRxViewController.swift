//
//  WithoutRxViewController.swift
//  SampleRx
//
//  Created by Rin on 2023/02/18.
//

import UIKit


final class WithoutRxViewController: UIViewController {

    @IBOutlet private weak var textField1: UITextField!
    @IBOutlet private weak var textField2: UITextField!
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var button: UIButton! {
        didSet {
            button.isHidden = true
        }
    }

    @IBAction private func tappedButton(_ sender: UIButton) {
        label.text = "押されたぁぁぁ"
    }

    @IBAction func changedTextField1(_ sender: UITextField) {
        button.isHidden = !isValid()
    }

    @IBAction func changedTextField2(_ sender: UITextField) {
        button.isHidden = !isValid()
    }

    private func isValid() -> Bool {
        let text1 = textField1.text ?? ""
        let text2 = textField2.text ?? ""
        return text1.count > 2 &&  text2.count > 2 && text1 == text2
    }
}
