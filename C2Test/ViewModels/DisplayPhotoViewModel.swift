//
//  DisplayPhotoViewModel.swift
//  C2Test
//
//  Created by Or Menashe on 21/01/2019.
//

import UIKit

protocol DisplayPhotoViewModelType {
    var delegate: DisplayPhotoViewModelDelegate? {get set}
    func getTitle() -> String
}

protocol DisplayPhotoViewModelDelegate: class {
    func showImage(_ image: UIImage)
}
class DisplayPhotoViewModel: DisplayPhotoViewModelType {
    private var photoInteractor: DisplayPhotoInteractorType
    private let photoItem: PhotoItem
    
    weak var delegate: DisplayPhotoViewModelDelegate?
    
    init(photoItem: PhotoItem, photoInteractor: DisplayPhotoInteractorType) {
        self.photoItem = photoItem
        self.photoInteractor = photoInteractor
        self.photoInteractor.delegate = self
        self.photoInteractor.getImageFromURl(imageUrl: self.photoItem.thumbnailUrl)
    }
    
    func getTitle() -> String {
        return self.photoItem.title
    }
}

extension DisplayPhotoViewModel: DisplayPhotoInteractorDelegate {
    func imageArrived(_ image: UIImage) {
        self.delegate?.showImage(image)
    }
}
