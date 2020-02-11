//
//  ContainerViewController.swift
//  Stack_test
//
//  Created by Михаил Борисов on 09.02.2020.
//  Copyright © 2020 Mikhail Borisov. All rights reserved.
//

import UIKit

@objc protocol ContainerViewProtocol {

    // forgot action
    func forgotPasswordAction()

    // signIn action
    func signInAction()

}

class ContainerViewController: UIViewController {

    // inizialization textField
    lazy var emailTextField = UITextField.container(.email)

    // inizialization textField
    lazy var passwordTextField = UITextField.container(.password)

    // inizialization property animation
    private var animation = UIViewPropertyAnimator(duration: 1, curve: .easeOut)

    // lazy inizialization of stackView
    lazy var stackView = UIStackView.container

    // lazy return label instanse with gesture when user forgot password
    lazy var forgotPasswordLabel: UILabel = {
        let label = UILabel.forgotPassword
        // add tapGesture to label
        label.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                          action: #selector(forgotPasswordAction)))
        return label
    }()

    // lazy return logIn button
    lazy var signInButton: UIButton = {
        // inizialization Button
        let button = UIButton.signIn
        button.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        return button
    }()

    // check which state should have stackView (using didSet)
    var isStackViewHidden: Bool = true {
        didSet {
            hideStackView(isStackViewHidden)
        }
    }

    var isSignInButtonIsHidden: Bool = true {
        didSet {
            hideSignInButton(isSignInButtonIsHidden)
        }
    }

    // loadView()
    override func loadView() {
        super.loadView()
        // set color to sunrize
        view.backgroundColor = .sunrize
        // add emailTextField
        stackView.addArrangedSubview(emailTextField)
        // add passwordtextField
        stackView.addArrangedSubview(passwordTextField)
        // add forgot password label
        stackView.addArrangedSubview(forgotPasswordLabel)
        // add stackView
        view.addSubview(stackView)
        // add button
        view.addSubview(signInButton)
        // prepare constraint
        prepareConstraints()
    }

}

// MARK: Prepare Constraints extension
private extension ContainerViewController {

    func prepareConstraints() {
        NSLayoutConstraint.activate([
            
            stackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.4),
            stackView.heightAnchor.constraint(lessThanOrEqualToConstant: 200),
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height * 0.07),
            // signInButton Constraint
            signInButton.heightAnchor.constraint(equalToConstant: 56),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
    }

}

// MARK: Hide/Unhide
private extension ContainerViewController {

    // conform hide/unhide animation
    func hideStackView(_ isHidden: Bool) {
        // create property animation
        animation = UIViewPropertyAnimator(duration: 0.5, curve: .easeOut) {
            // change alpha using state
            self.stackView.alpha = isHidden ? 0 : 1
        }
        // check which state we have right now
        switch isHidden {
        case true:
            self.animation.startAnimation()
            isSignInButtonIsHidden = true
            // when animation completed
        case false:
            self.animation.startAnimation(afterDelay: 0.5)
            isSignInButtonIsHidden = false
            // when dismiss animation of contaner View completed
        }
    }

    // conform hide/unhide animation to button
    func hideSignInButton(_ isHidden: Bool) {
        #if DEBUG
        print(#function)
        #endif
        switch isHidden {
        case true:
            UIView.animate(withDuration: 0.5, animations: {
                self.signInButton.alpha = 0.0
            }, completion: { _ in
                self.signInButton.isHidden = true
            })
        case false:
            self.signInButton.isHidden = false
            UIView.animate(withDuration: 0.5, animations: {
                self.signInButton.alpha = 1.0
            })
        }
    }

}

// MARK: action extension
@objc extension ContainerViewController: ContainerViewProtocol {

    // forgot password Action
    func forgotPasswordAction() {
        #if DEBUG
        print(#function)
        #endif
    }

    // sign in action
    func signInAction() {
        #if DEBUG
        print(#function)
        #endif

        /*
         AuthService.login { (error, result) in
         ...
         }
         */
    }

}
