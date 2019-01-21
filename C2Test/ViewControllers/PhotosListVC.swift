//
//  PhotosListVC.swift
//  C2Test
//
//  Created by Or Menashe on 21/01/2019.
//

import UIKit
import Cartography

class PhotosListVC: UIViewController {
    private let cellId = "PhotoListCell"
    private var viewModel : PhotosListViewModelType
    private let displayPhotoVCFactory: DisplayPhotoVCFactory
    
    private let photosTableView = UITableView()
    
    init(photosListViewModel: PhotosListViewModelType, displayPhotoVCFactory: DisplayPhotoVCFactory) {
        self.viewModel = photosListViewModel
        self.displayPhotoVCFactory = displayPhotoVCFactory
        super.init(nibName: nil, bundle: nil)
        self.layoutViews()
        self.setupViews()
    }
    
    private func setupViews() {
        self.photosTableView.delegate = self
        self.photosTableView.dataSource = self
        self.photosTableView.register(PhotosListCell.self, forCellReuseIdentifier: self.cellId)
        self.viewModel.delegate = self
    }
    
    private func layoutViews() {
        self.view.addSubview(self.photosTableView)
        
        constrain(self.view, self.photosTableView) { container, tableView in
            tableView.edges == container.edges
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PhotosListVC: PhotosListViewModelDelegate {
    func reloadData() {
        self.photosTableView.reloadData()
    }
}

extension PhotosListVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.numberOfSections()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let photoCell = self.photosTableView.dequeueReusableCell(withIdentifier: self.cellId) as? PhotosListCell else {
            print("could not dequque cell with id: \(self.cellId)")
            return UITableViewCell()
        }
        
        let photoItem = self.viewModel.getPhotoForIndex(index: indexPath.row)
        photoCell.setNumber("\(indexPath.row)")
        photoCell.setTitle(photoItem.title)
        return photoCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photoItem = self.viewModel.getPhotoForIndex(index: indexPath.row)
        let displayPhotoVC = self.displayPhotoVCFactory.create(photoItem: photoItem)
        self.navigationController?.pushViewController(displayPhotoVC, animated: true)
    }
}
