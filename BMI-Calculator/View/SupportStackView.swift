//
//  SupportStackView.swift
//  BMI-Calculator
//
//  Created by Андрей Фроленков on 3.02.23.
//

import UIKit

class SupportStackView: UIStackView {

    let labelOne: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 17, weight: .light)
        return label
    }()
    
    let labelTwo: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 17, weight: .light)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        axis = .horizontal
        distribution = .fillEqually
        translatesAutoresizingMaskIntoConstraints = false
        addSub()
    }
    
    private func addSub() {
        
        addArrangedSubview(labelOne)
        addArrangedSubview(labelTwo)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
