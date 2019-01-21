//
//  PhotosListViewModel.swift
//  C2Test
//
//  Created by Or Menashe on 21/01/2019.
//

import UIKit

protocol PhotosListViewModelType {
    var delegate: PhotosListViewModelDelegate? {get set}
}

protocol PhotosListViewModelDelegate: class {
    func reloadData()
}

class PhotosListViewModel: PhotosListViewModelType {
    weak var delegate: PhotosListViewModelDelegate?
    var photosInteractor: PhotosListInteractorType
    
    private var photosList = [PhotoItem]()
    
    init(photosListInteractor: PhotosListInteractorType) {
        self.photosInteractor = photosListInteractor
        self.photosInteractor.delegate = self
    }
}

extension PhotosListViewModel: PhotosListInteractorDelegate {
    func photosListArrived(photosList: [PhotoItem]) {
        self.photosList = photosList
        self.delegate?.reloadData()
    }
}
