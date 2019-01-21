//
//  DisplayPhotoVC.swift
//  C2Test
//
//  Created by Or Menashe on 21/01/2019.
//

import UIKit

class DisplayPhotoVC: UIViewController {
    let viewModel: DisplayPhotoViewModelType
    
    init(viewModel: DisplayPhotoViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
