//
//  PhotosListViewModel.swift
//  C2Test
//
//  Created by Or Menashe on 21/01/2019.
//

import UIKit

protocol PhotosListViewModelType {
    var delegate: PhotosListViewModelDelegate? {get set}
    func numberOfSections() -> Int
    func numberOfRows() -> Int
    func getPhotoForIndex(index: Int) -> PhotoItem
}

protocol PhotosListViewModelDelegate: class {
    func reloadData()
}

class PhotosListViewModel: PhotosListViewModelType {
    
    weak var delegate: PhotosListViewModelDelegate?
    private var photosInteractor: PhotosListInteractorType
    
    private var photosList = [PhotoItem]()
    
    init(photosListInteractor: PhotosListInteractorType) {
        self.photosInteractor = photosListInteractor
        self.photosInteractor.delegate = self
    }
    
    func numberOfSections() -> Int {
        if self.photosList.isEmpty {
            return 0
        }
        
        return 1
    }
    
    func numberOfRows() -> Int {
        return self.photosList.count
    }
    
    func getPhotoForIndex(index: Int) -> PhotoItem {
        return self.photosList[index]
    }
}

extension PhotosListViewModel: PhotosListInteractorDelegate {
    func photosListArrived(photosList: [PhotoItem]) {
        self.photosList = photosList
        self.delegate?.reloadData()
    }
}
