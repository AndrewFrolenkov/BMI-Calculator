//
//  ViewController.swift
//  BMI-Calculator
//
//  Created by Андрей Фроленков on 3.02.23.
//

import UIKit
import Foundation

class CalculateViewController: UIViewController {
    
    var calculateBrain = CalculateBrain()
    
    let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "calculate_background")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
   lazy var stackView: MainStackView = {
        let stackView = MainStackView(frame: .zero)
        stackView.sliderOne.addTarget(self, action: #selector(heightSliderChanged(_:)), for: .valueChanged)
        stackView.sliderTwo.addTarget(self, action: #selector(weightSliderChanged(_:)), for: .valueChanged)
       stackView.button.addTarget(self, action: #selector(calculatePressed(_:)), for: .touchUpInside)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAllSubview()
        setAllConstraints()
    }
    
    @objc private func calculatePressed (_ sender: UIButton) {
        
        let height = stackView.sliderOne.value
        let weight = stackView.sliderTwo.value
        
        let secondVC = ResultViewController()
        secondVC.bmiValue = calculateBrain.calculateBMI(height: height, weight: weight)
        secondVC.view.backgroundColor = calculateBrain.getColor()
        secondVC.stackView.labelThree.text = calculateBrain.getadvice()
        self.present(secondVC, animated: true)
    }
    
    @objc private func heightSliderChanged(_ sender: UISlider) {
        
        stackView.setTextLabelOne(text: sender.value)
        
    }
    
    @objc private func weightSliderChanged(_ sender: UISlider) {
        
        stackView.setTextLabelTwo(text: sender.value)
    }
    
    private func addAllSubview() {
        
        self.view.addSubview(backgroundImage)
        self.view.addSubview(stackView)
    }
    
    private func setAllConstraints() {
        // backgroundImage
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        // stackView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

