//
//  SignUpViewController.swift
//  Animating-Login-Signup
//
//  Created by Vasanth Rathnakumar on 2020-03-27.
//  Copyright © 2020 Vasanth Rathnakumar. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak private var fullNameTextField: UITextField!
    @IBOutlet weak private var emailTextField: UITextField!
    @IBOutlet weak private var birthdayTextField: UITextField!
    @IBOutlet weak private var fullNameErrorLabel: UILabel!
    @IBOutlet weak private var emailErrorLabel: UILabel!
    @IBOutlet weak private var birthdayErrorLabel: UILabel!
    @IBOutlet weak private var nextButton: UIButton!
    @IBOutlet weak private var maleGenderButton: PMSuperButton!
    @IBOutlet weak private var femaleGenderButton: PMSuperButton!
    @IBOutlet weak private var maleShadow: UIView!
    @IBOutlet weak private var femaleShadow: UIView!
    @IBOutlet weak private var backButton: UIButton!
    @IBOutlet weak private var facebookButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextFields()
        setupErrorLabels()
        setupGenderButton()
        setupButtonImageColor()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

private extension SignUpViewController {
    
    func setupTextFields() {
        func setupLoginTextField(textField: UITextField, placeHolder: String) {
            textField.font = FontHandler.Style.Body1.font
            textField.setLeftPaddingPoints(Helper.marginLeft)
            textField.setRightPaddingPoints(Helper.marginRight)
            textField.font = textField.font!.withSize(18)
            textField.attributedPlaceholder =
                NSAttributedString(string: placeHolder, attributes: [NSAttributedString.Key.foregroundColor: FontHandler.FerryColor.text_light.color])
        }
        func setupTextFieldShadow(textField: UITextField) {
            textField.layer.masksToBounds = false
            textField.layer.shadowRadius = 10
            textField.layer.shadowColor = UIColor.black.cgColor
            textField.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            textField.layer.shadowOpacity = 0.2
        }
        setupTextFieldShadow(textField: fullNameTextField)
        setupTextFieldShadow(textField: emailTextField)
        setupTextFieldShadow(textField: birthdayTextField)
        setupLoginTextField(textField: fullNameTextField, placeHolder: "Full Name")
        setupLoginTextField(textField: emailTextField, placeHolder: "Email")
        setupLoginTextField(textField: birthdayTextField, placeHolder: "Birthday")
    }
    
    func setupErrorLabels() {
        func setupErrorStateLabel(label: UILabel) {
            label.text = "Field cannot be empty"
            label.font = FontHandler.Style.h5.font
            label.textColor = FontHandler.FerryColor.error_State.color
        }
        setupErrorStateLabel(label: fullNameErrorLabel)
        setupErrorStateLabel(label: emailErrorLabel)
        setupErrorStateLabel(label: birthdayErrorLabel)
    }
    
    func setupGenderButton() {
        func setupGenderButtonShadow(view: UIView) {
            view.layer.masksToBounds = false
            view.layer.shadowRadius = 2
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            view.layer.shadowOpacity = 0.2
        }
        func genderClosure() {
            maleGenderButton.touchUpInside {
                self.maleGenderButton.setImage(UIImage(named: "MaleHighlighted"), for: .normal)
                self.femaleGenderButton.setImage(UIImage(named: "FemaleUnhighlighted"), for: .normal)
            }
            femaleGenderButton.touchUpInside {
                self.maleGenderButton.setImage(UIImage(named: "MaleUnhighlighted"), for: .normal)
                self.femaleGenderButton.setImage(UIImage(named: "FemaleHighlighted"), for: .normal)
            }
        }
        genderClosure()
        setupGenderButtonShadow(view: maleShadow)
        setupGenderButtonShadow(view: femaleShadow)
    }
    
    func setupButtonImageColor() {
        let backImage = UIImage(named: "TutorialRightArrow")?.rotate(radians: .pi)
        backButton.setImage(backImage, for: .normal)
        backButton.imageView?.setImageColor(color: FontHandler.FerryColor.black.color)
        facebookButton.imageView?.setImageColor(color: FontHandler.FerryColor.white.color)
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
