//
//  ViewController.swift
//  Swift-Sample-UINavigationController
//
//  Created by A10 Lab Inc. 003 on 2018/04/18.
//  Copyright © 2018年 A10 Lab Inc. 003. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let color: UIColor

    let containerLeft: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    let containerRight: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    let pushButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("push", for: UIControlState())
        button.setTitleColor(.blue, for: UIControlState())
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        return button
    }()

    let presentButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("present", for: UIControlState())
        button.setTitleColor(.blue, for: UIControlState())
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        return button
    }()

    init(color: UIColor, isPresent: Bool = false) {
        self.color = color
        super.init(nibName: nil, bundle: nil)
        if isPresent {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(self.onCloseTapped))
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color

        pushButton.addTarget(self, action: #selector(self.onPushTapped), for: .touchUpInside)
        presentButton.addTarget(self, action: #selector(self.onPresentTapped), for: .touchUpInside)

        view.addSubview(containerLeft)
        view.addSubview(containerRight)
        containerLeft.addSubview(pushButton)
        containerRight.addSubview(presentButton)

        containerLeft.translatesAutoresizingMaskIntoConstraints = false
        containerLeft.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerLeft.trailingAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerLeft.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        containerLeft.heightAnchor.constraint(equalToConstant: 50).isActive = true

        containerRight.translatesAutoresizingMaskIntoConstraints = false
        containerRight.leadingAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerRight.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        containerRight.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        containerRight.heightAnchor.constraint(equalToConstant: 50).isActive = true

        pushButton.translatesAutoresizingMaskIntoConstraints = false
        pushButton.centerXAnchor.constraint(equalTo: containerLeft.centerXAnchor).isActive = true
        pushButton.centerYAnchor.constraint(equalTo: containerLeft.centerYAnchor).isActive = true
        pushButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        pushButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        presentButton.translatesAutoresizingMaskIntoConstraints = false
        presentButton.centerXAnchor.constraint(equalTo: containerRight.centerXAnchor).isActive = true
        presentButton.centerYAnchor.constraint(equalTo: containerRight.centerYAnchor).isActive = true
        presentButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        presentButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    @objc func onPushTapped(_ sender: UIButton) {
        navigationController?.pushViewController(ViewController(color: .cyan), animated: true)
    }

    @objc func onPresentTapped(_ sender: UIButton) {
        let nvc = UINavigationController(rootViewController: ViewController(color: .magenta, isPresent: true))
        present(nvc, animated: true, completion: nil)
    }

    @objc func onCloseTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
