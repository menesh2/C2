//
//  LoadingView.swift
//  C2Test
//
//  Created by Or Menashe on 21/01/2019.
//

import UIKit
import Cartography

class LoadingView: UIView {
   
    let loadingIndicator = UIActivityIndicatorView()
    

    init() {
        super.init(frame: CGRect.zero)
        self.layoutViews()
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutViews() {

        self.addSubview(self.loadingIndicator)
        
        constrain(self, self.loadingIndicator) {container, loadingIndicator in
            loadingIndicator.centerY == container.centerY
            loadingIndicator.centerX == container.centerX
        }
    }
    
    private func setupViews() {

        self.loadingIndicator.style = .whiteLarge
        self.loadingIndicator.color = .black
        self.loadingIndicator.startAnimating()
        self.backgroundColor = .white
    }
    
    func hideLoadingWithAnimation() {
        
        UIView.animate(withDuration: 1.0) {
            self.alpha = 0
        }
    }
}
