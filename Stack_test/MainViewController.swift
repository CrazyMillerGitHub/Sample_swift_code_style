//
//  MainViewController.swift
//  Stack_test
//
//  Created by Михаил Борисов on 09.02.2020.
//  Copyright © 2020 Mikhail Borisov. All rights reserved.
//

import UIKit
import AnimationFramework

class MainViewController: UIViewController {

    // inizialize property panGesture recognizer
    private weak var panGestureRecognizer: UIPanGestureRecognizer!
    // inizialize property tapGesture recognizer
    private weak var tapGestureRecognizer: UITapGestureRecognizer!
    // inizialize property widthConstraint
    private weak var widthConstraint: NSLayoutConstraint!
    // inizialize property centerYConstraint
    private weak var centerYConstraint: NSLayoutConstraint!
    // create animation
    private var animation = UIViewPropertyAnimator(duration: 1, curve: .easeOut)
    // inizialize title Label
    private var titleLabel = UILabel.title
    // inizialize description label
    private var descriptionLabel = UILabel.description
    // inizialize email button
    private var emailButton = UIButton.emailSignIn
    // inizialize apple button
    private var appleSignInButton = UIButton.appleSignIn
    // return Container view
    lazy var containerView: ContainerViewController = {
        let containerView = ContainerViewController()
        containerView.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.view.isUserInteractionEnabled = true
        return containerView
    }()

    // loadView()
    override func loadView() {
        super.loadView()
        //
        view.backgroundColor = .systemBackground
        // create PanGesture
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(slideDown(_:)))
        // disable gesture right now
        gesture.isEnabled = false
        // add dependency to propery
        self.panGestureRecognizer = gesture
        // create tapGesture recognizer
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedAction(_:)))
        // add dependency to property
        self.tapGestureRecognizer = tapGestureRecognizer
        // adding gestures to container view
        containerView.view.addGestureRecognizer(self.panGestureRecognizer)
        containerView.view.addGestureRecognizer(self.tapGestureRecognizer)
        // prepare you
        prepareUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // create containerView and link with superView
        self.add(containerView)
        // adding constraints
        prepareConstraints()
    }

    override func viewDidLayoutSubviews() {
        // set corner radius to a half of container view
        containerView.view.layer.cornerRadius = containerView.view.bounds.width / 2
    }

}

// Prepare UI and Constraints
private extension MainViewController {
    
    /// prepare ui by adding elements to superView
    func prepareUI() {
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(emailButton)
        view.addSubview(appleSignInButton)
    }
    
    func prepareConstraints() {
        // inizinalize width constraint
        let widthConstraint = containerView.view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2)
        // inizinalize centerYConstraint constraint
        let centerYConstraint = containerView.view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        NSLayoutConstraint.activate([
            widthConstraint,
            // add heightAnchor constraint equal to widthConstraint
            containerView.view.heightAnchor.constraint(equalTo: containerView.view.widthAnchor),
            // centre our container in superView
            containerView.view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            centerYConstraint,
            // adding top padding to constant 79
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 79),
            // set leading anchor to 33 [leading - view - trailing]
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 33),
            // set title height to 43
            titleLabel.heightAnchor.constraint(equalToConstant: 43),
            // set trailing anchor to -33 [leading - view - trailing]
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -33),
            // set describtion label equal to title label leading
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            // set trailing label equal to title label trailing
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            // set top anchor to constant 40
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 40),
            // set height anchor equal to titleLabel anchor
            descriptionLabel.heightAnchor.constraint(equalTo: titleLabel.heightAnchor),
            
            appleSignInButton.topAnchor.constraint(equalTo: containerView.view.bottomAnchor, constant: 60),
            appleSignInButton.heightAnchor.constraint(equalToConstant: 46.0),
            appleSignInButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            appleSignInButton.widthAnchor.constraint(equalToConstant: view.frame.width / 2 + 80),
            
            emailButton.topAnchor.constraint(equalTo: self.appleSignInButton.bottomAnchor, constant: 20),
            emailButton.leadingAnchor.constraint(equalTo: self.appleSignInButton.leadingAnchor, constant: 0),
            emailButton.trailingAnchor.constraint(equalTo: self.appleSignInButton.trailingAnchor, constant: 0),
            emailButton.heightAnchor.constraint(equalToConstant: CGFloat(46.0))
        ])
        // add dependecies to properties
        self.widthConstraint = widthConstraint
        self.centerYConstraint = centerYConstraint
    }

}

// All about animation
@objc private extension MainViewController {
   
    func slideDown(_ sender: UIPanGestureRecognizer) {
        // inizialize slide down animation
        AnimationFramework.slideDownAnimation(containerBoolean: &containerView.isStackViewHidden,
                           to: self.view,
                           animator: &animation,
                           widthConstraint: widthConstraint,
                           centerYConstraint: centerYConstraint,
                           panGesture: panGestureRecognizer,
                           tapGesture: tapGestureRecognizer,
                           sender: sender)
    }

    func tappedAction(_ gesture: UITapGestureRecognizer) {
        // inizialize circle tap animation
        AnimationFramework.circleTapAnimation(in: self.view, widthConstraint: widthConstraint, centerYConstraint: centerYConstraint) {
            // toggle gestures + boolean stackViewHidden
            self.containerView.isStackViewHidden.toggle()
            self.tapGestureRecognizer.isEnabled.toggle()
            self.panGestureRecognizer.isEnabled.toggle()
        }
    }

}
