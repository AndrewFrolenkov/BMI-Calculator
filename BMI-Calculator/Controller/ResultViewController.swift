//
//  SecondViewController.swift
//  BMI-Calculator
//
//  Created by Андрей Фроленков on 3.02.23.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue = "0.0"
    
    let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "result_background")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let stackView: StackViewSecondVC = {
        let stack = StackViewSecondVC(frame: .zero)
        stack.labelOne.text = "YOUR RESULT"
        stack.labelTwo.text = "19.5"
        stack.labelThree.text = "EAT SOME MORE SNACKS!"
        return stack
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("RECALCULATE", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.setTitleColor(#colorLiteral(red: 0.4549019608, green: 0.4470588235, blue: 0.8235294118, alpha: 1), for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(recalculatePressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.2, green: 0.4823529412, blue: 0.7725490196, alpha: 1)
        self.stackView.labelTwo.text = bmiValue
        addAllSubview()
        setAllConstraints()
    }
    
    private func addAllSubview() {
        
        self.view.addSubview(backgroundImage)
        self.view.addSubview(stackView)
        self.view.addSubview(button)
    }
    
    @objc func recalculatePressed() {
        self.dismiss(animated: true)
    }
    
    private func setAllConstraints() {
        
        // backgroundImage
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        //stackView
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // button
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 51),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        
        
        ])
        
    }
    
}
