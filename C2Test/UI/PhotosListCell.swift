//
//  PhotosListCell.swift
//  C2Test
//
//  Created by Or Menashe on 21/01/2019.
//

import UIKit
import Cartography

class PhotosListCell: UITableViewCell {
    private let numberLabel = UILabel()
    private let titleLabel = UILabel()
    
    private let horizontalPadding = CGFloat(20)
    private let verticalPadding = CGFloat(10)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.layoutViews()
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutViews() {
        self.addSubview(self.numberLabel)
        self.addSubview(self.titleLabel)
        
        constrain(self, self.numberLabel, self.titleLabel) { [weak self] container, numberLabel, titleLabel in
            numberLabel.top == container.top + (self?.verticalPadding ?? 0)
            numberLabel.leading == container.leading + (self?.horizontalPadding ?? 0)
            numberLabel.bottom == container.bottom - (self?.verticalPadding ?? 0)
            
            titleLabel.top == numberLabel.top
            titleLabel.leading == numberLabel.trailing + (self?.horizontalPadding ?? 0)
            titleLabel.trailing == container.trailing - (self?.horizontalPadding ?? 0)
            titleLabel.bottom == numberLabel.bottom
        }
        
        self.numberLabel.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 900), for: .horizontal)
        self.numberLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 700), for: .horizontal)
        
        self.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 250), for: .horizontal)
    }
    
    private func setupViews() {
        self.titleLabel.textAlignment = .left
        self.titleLabel.numberOfLines = 0
        self.numberLabel.textAlignment = .left
    }
    
    func setNumber(_ number: String) {
        self.numberLabel.text = number
    }
    
    func setTitle(_ title: String) {
        self.titleLabel.text = title
    }
}
