//
//  DisplayPhotoVC.swift
//  C2Test
//
//  Created by Or Menashe on 21/01/2019.
//

import UIKit
import Cartography

class DisplayPhotoVC: UIViewController {
    
    private let titleLabel = UILabel()
    private let imageView = UIImageView()

    private let verticalPadding = CGFloat(10)
    private let horizontalPadding = CGFloat(20)
    
    private var viewModel: DisplayPhotoViewModelType
    
    init(viewModel: DisplayPhotoViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.layoutViews()
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutViews() {
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.imageView)
        
        constrain(self.view, self.titleLabel, self.imageView) { [weak self] container, titleLabel, imageView in
            titleLabel.top == container.topMargin + (self?.verticalPadding ?? 0)
            titleLabel.leading == container.leading + (self?.horizontalPadding ?? 0)
            titleLabel.trailing == container.trailing - (self?.horizontalPadding ?? 0)
            
            imageView.centerX == container.centerX
            imageView.centerY == container.centerY
        }
    }
    
    private func setupViews() {
        self.titleLabel.textAlignment = .center
        self.titleLabel.numberOfLines = 0
        self.titleLabel.text = self.viewModel.getTitle()
        self.imageView.contentMode = .center
        
        self.viewModel.delegate = self
        self.view.backgroundColor = .white
    }
}

extension DisplayPhotoVC: DisplayPhotoViewModelDelegate {
    func showImage(_ image: UIImage) {
        self.imageView.image = image
        self.imageView.layoutIfNeeded()
    }
}
