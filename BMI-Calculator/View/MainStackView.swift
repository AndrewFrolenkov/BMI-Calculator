//
//  MainStackView.swift
//  BMI-Calculator
//
//  Created by Андрей Фроленков on 3.02.23.
//

import UIKit

class MainStackView: UIStackView {
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "CALCULATE YOUR BMI"
        label.font = .boldSystemFont(ofSize: 40)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    let stackOne: SupportStackView = {
        let stack = SupportStackView(frame: .zero)
        stack.labelOne.text = "Height"
        stack.labelTwo.text = "1.5m"
        return stack
    }()
    
    let stackTwo: SupportStackView = {
        let stack = SupportStackView(frame: .zero)
        stack.labelOne.text = "Weight"
        stack.labelTwo.text = "100Kg"
        return stack
    }()
    
    lazy var sliderOne: UISlider = {
        let slider = UISlider()
        return settingSlider(min: 1, max: 3, value: 2)
    }()
    
    lazy var sliderTwo: UISlider = {
        let slider = UISlider()
        return settingSlider(min: 0, max: 200, value: 100)
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("CALCULATE", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.backgroundColor = #colorLiteral(red: 0.3843137255, green: 0.3764705882, blue: 0.6156862745, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        spacing = 10
        axis = .vertical
        
        addSub()
        setConstraints()
    }
    
    private func addSub() {
        
        addArrangedSubview(label)
        addArrangedSubview(stackOne)
        addArrangedSubview(sliderOne)
        addArrangedSubview(stackTwo)
        addArrangedSubview(sliderTwo)
        addArrangedSubview(button)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            stackOne.heightAnchor.constraint(equalToConstant: 21),
            stackTwo.heightAnchor.constraint(equalToConstant: 21),
            sliderOne.heightAnchor.constraint(equalToConstant: 60),
            sliderTwo.heightAnchor.constraint(equalToConstant: 60),
            button.heightAnchor.constraint(equalToConstant: 51)
            
        ])
    }
    
    private func settingSlider(min: Float, max: Float, value: Float) -> UISlider {
        
        let slider = UISlider()
        slider.minimumValue = min
        slider.maximumValue = max
        slider.value = value
        slider.minimumTrackTintColor = #colorLiteral(red: 0.5301787853, green: 0.5373442173, blue: 0.8578383327, alpha: 0.5179794521)
        slider.thumbTintColor = #colorLiteral(red: 0.5301787853, green: 0.5373442173, blue: 0.8578383327, alpha: 0.5179794521)
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        return slider
    }
    
    func setTextLabelOne(text: Float) {
        
        let height = String(format: "%.2f", text) + "m"
        stackOne.labelTwo.text = height
        
    }
    
    func setTextLabelTwo(text: Float) {
        
        let weight = String(format: "%.0f", text) + "kg"
        stackTwo.labelTwo.text = weight
    }
}
