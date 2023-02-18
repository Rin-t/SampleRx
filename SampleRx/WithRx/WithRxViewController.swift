//
//  ViewController.swift
//  SampleRx
//
//  Created by Rin on 2023/02/18.
//

import UIKit
import RxSwift
import RxCocoa

final class WithRxViewController: UIViewController {

    @IBOutlet private weak var button: UIButton!
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var textField1: UITextField!
    @IBOutlet private weak var textField2: UITextField!

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        button.rx.tap
            .subscribe( onNext: { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.label.text = "押されたぁぁぁ"
            })
            .disposed(by: disposeBag)

        Observable
            .combineLatest(textField1.rx.text.orEmpty,
                           textField2.rx.text.orEmpty)
            .subscribe(onNext: { [weak self] text1, text2 in
                guard let strongSelf = self else { return }
                strongSelf.button.isHidden = !strongSelf.isValid(text1: text1, text2: text2)
            })
            .disposed(by: disposeBag)
    }

    private func isValid(text1: String, text2: String) -> Bool {
        text1.count > 2 &&  text2.count > 2 && text1 == text2
    }
}




//
//button.rx.tap
//    .map { "押されたぁぁぁ" }
//    .bind(to: label.rx.text)
//    .disposed(by: disposeBag)
//
//Observable
//    .combineLatest(textField1.rx.text.orEmpty,
//                   textField2.rx.text.orEmpty)
//    .map { self.isValid(text1: $0, text2: $1) }
//    .map { !$0 }
//    .bind(to: button.rx.isHidden)
//    .disposed(by: disposeBag)
