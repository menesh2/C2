//
//  PhotosListVC.swift
//  C2Test
//
//  Created by Or Menashe on 21/01/2019.
//

import UIKit

class PhotosListVC: UIViewController {
    
    let viewModel : PhotosListViewModelType
    
    init(photosListViewModelType: PhotosListViewModelType) {
        self.viewModel = photosListViewModelType
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = UIColor.green
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

