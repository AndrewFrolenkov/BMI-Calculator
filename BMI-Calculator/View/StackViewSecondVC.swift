//
//  StackViewSecondVC.swift
//  BMI-Calculator
//
//  Created by Андрей Фроленков on 3.02.23.
//

import UIKit

class StackViewSecondVC: UIStackView {

    lazy var labelOne: UILabel = {
        return configureLabel(size: 35, weight: .bold)
    }()
    
    lazy var labelTwo: UILabel = {
        return configureLabel(size: 80, weight: .bold)
    }()
    
    lazy var labelThree: UILabel = {
        return configureLabel(size: 20, weight: .light)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        axis = .vertical
        alignment = .fill
        spacing = 8
        distribution = .fill
        translatesAutoresizingMaskIntoConstraints = false
        
        addSub()
    }
    
    private func addSub() {
        
        addArrangedSubview(labelOne)
        addArrangedSubview(labelTwo)
        addArrangedSubview(labelThree)
    }
    
    private func configureLabel(size ofSize: CGFloat, weight: UIFont.Weight) -> UILabel {
        
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: ofSize, weight: weight)
        return label
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
}
