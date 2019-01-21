//
//  PhotosListVC.swift
//  C2Test
//
//  Created by Or Menashe on 21/01/2019.
//

import UIKit
import Cartography

class PhotosListVC: UIViewController {
    
    private let viewModel : PhotosListViewModelType
    private let photosListView = UITableView()
    
    init(photosListViewModel: PhotosListViewModelType) {
        self.viewModel = photosListViewModel
        super.init(nibName: nil, bundle: nil)
        self.layoutViews()
    }
    
    private func layoutViews() {
        self.view.addSubview(self.photosListView)
        
        constrain(self.view, self.photosListView) { container, tableView in
            tableView.edges == container.edges
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PhotosListVC: PhotosListViewModelDelegate {
    func reloadData() {
        self.photosListView.reloadData()
    }
}

