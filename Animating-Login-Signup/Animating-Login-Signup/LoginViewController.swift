//
//  LoginViewController.swift
//  Animating-Login-Signup
//
//  Created by Vasanth Rathnakumar on 2020-03-27.
//  Copyright © 2020 Vasanth Rathnakumar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak private var welcomeLabel: UILabel!
    @IBOutlet weak private var ferryLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    @IBOutlet weak private var phoneNumberTextField: UITextField!
    @IBOutlet weak private var nextButton: UIButton!
    @IBOutlet weak private var bottomView: UIView!
    @IBOutlet weak private var ferryLogo: UIImageView!
    @IBOutlet weak private var errorLabel: UILabel!

    @IBOutlet weak private var outerScrollView: UIScrollView!
    @IBOutlet weak private var bottomViewHeightConstraints: NSLayoutConstraint!
    @IBOutlet weak private var mobileNumberTextFieldTopConstraints: NSLayoutConstraint!
    // 4: 5 ratio for green background
    private let ratio_4_5: CGFloat = (UIScreen.main.bounds.height) / 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoginTextField()
        setupTextFieldShadow()
        ferryLabel.addCharactersSpacing(spacing: 8, text: ferryLabel.text!)
        nextButtonAndLogoInitialIdentity()
        animatingLabelsOpacity(alpha: 0)
        animatingTextFieldOpacity(alpha: 0)
        animateBottomView()
        setupAttributedTextToDescriptionLabel()
        setupErrorStateLabel()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

private extension LoginViewController {
    
    func animateBottomView() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseOut], animations: {
                self.bottomViewHeightConstraints.constant = self.ratio_4_5 + 28//TextField Top padding
                self.animatingLabelsOpacity(alpha: 1.0)
                self.view.layoutIfNeeded()
            }) { (isCompleted) in
                UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseOut], animations: {
                    self.animatingTextFieldOpacity(alpha: 1.0)
                    self.mobileNumberTextFieldTopConstraints.constant = -28 // Textfield top padding
                    self.view.layoutIfNeeded()
                }) { (isCompleted) in
                    self.nextButtonAndLogoInitialIdentity(isHidden: false)
                    UIView.animate(withDuration: 0.2, animations: {
                        self.nextButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                    }, completion: { (isCompleted) in
                        UIView.animate(withDuration: 0.2, animations: {
                            self.nextButton.transform = CGAffineTransform.identity
                        }, completion: { (isCompleted) in
                        })
                    })
                }
            }
        }
    }
    
    func animatingLabelsOpacity(alpha: CGFloat) {
        welcomeLabel.alpha = alpha
        ferryLabel.alpha = alpha
        descriptionLabel.alpha = alpha
    }
    
    func animatingTextFieldOpacity(alpha: CGFloat) {
        phoneNumberTextField.alpha = alpha
    }
    
    func nextButtonAndLogoInitialIdentity(isHidden: Bool = true) {
        nextButton.isHidden = isHidden
        ferryLogo.isHidden = isHidden
        nextButton.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
    }
    
    func setupAttributedTextToDescriptionLabel() {
        let descriptionString: String = descriptionLabel.text!
        if descriptionString.range(of:"1000+ Rewards") != nil {
            let fontName = FontHandler.FontName.NunitoSansExtraLight.fontName
            let font = UIFont(name: fontName, size: 18)
            let attributedString = NSMutableAttributedString(string: descriptionLabel.text!, attributes: [NSAttributedString.Key.font: font!])
            let boldFontName = FontHandler.FontName.NunitoSansSemiBold.fontName
            let boldFontHandler = UIFont(name: boldFontName, size: 18)
            let boldFontHandlerAttribute = [NSAttributedString.Key.font: boldFontHandler!]
            let range = NSRange(descriptionString.range(of:"1000+ Rewards")!, in: "1000+ Rewards")
            attributedString.addAttributes(boldFontHandlerAttribute, range: range)
            descriptionLabel.attributedText = attributedString
        }
    }
    
    func setupTextFieldShadow() {
        phoneNumberTextField.layer.masksToBounds = false
        phoneNumberTextField.layer.shadowRadius = 10
        phoneNumberTextField.layer.shadowColor = UIColor.black.cgColor
        phoneNumberTextField.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        phoneNumberTextField.layer.shadowOpacity = 0.2
    }
    
    func setupLoginTextField() {
        phoneNumberTextField.font = FontHandler.Style.Body1.font
        phoneNumberTextField.setLeftPaddingPoints(Helper.marginLeft)
        phoneNumberTextField.setRightPaddingPoints(Helper.marginRight)
        phoneNumberTextField.font = phoneNumberTextField.font!.withSize(18)
        phoneNumberTextField.attributedPlaceholder =
            NSAttributedString(string: "Mobile Number", attributes: [NSAttributedString.Key.foregroundColor: FontHandler.FerryColor.text_light.color])
    }
    
    func setupErrorStateLabel() {
        errorLabel.text = "Field cannot be empty"
        errorLabel.font = FontHandler.Style.h5.font
        errorLabel.textColor = FontHandler.FerryColor.error_State.color
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signupViewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewControllerIdentifier") as! SignUpViewController
        self.navigationController?.pushViewController(signupViewController, animated: true)
    }
}

