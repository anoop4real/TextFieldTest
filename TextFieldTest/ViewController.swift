//
//  ViewController.swift
//  TextFieldTest
//
//  Created by Anoop M on 2020-03-26.
//  Copyright © 2020 Anoop M. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var widthMultiplier: CGFloat = 0.7
    private var button = UIButton(type: .system)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpView()
        // Do any additional setup after loading the view.
    }

    lazy var myTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "0"
        textField.font = UIFont.systemFont(ofSize: 70)
        textField.textColor = UIColor.black
        textField.minimumFontSize = 35
        textField.textAlignment = .right
        return textField
    }()

    @IBAction func textChanged(_ txtField: UITextField) {
        if txtField.frame.width >= (view.frame.width * widthMultiplier).rounded() {
            txtField.adjustsFontSizeToFitWidth = true
        } else {
            txtField.adjustsFontSizeToFitWidth = false
        }
    }

    func setUpView() {
        view.addSubview(myTextField)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Click", for: .normal)
        NSLayoutConstraint.activate([
            myTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myTextField.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, multiplier: widthMultiplier),
            
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.leftAnchor.constraint(equalTo: myTextField.rightAnchor, constant: 8),
            button.heightAnchor.constraint(equalToConstant: 44.0),

        ])
    }
}
