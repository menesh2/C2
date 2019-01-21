//
//  DisplayPhotoViewModel.swift
//  C2Test
//
//  Created by Or Menashe on 21/01/2019.
//

import UIKit

protocol DisplayPhotoViewModelType {
    
}
class DisplayPhotoViewModel: DisplayPhotoViewModelType {
    private let photoItem: PhotoItem
    
    init(photoItem: PhotoItem) {
        self.photoItem = photoItem
    }
}
