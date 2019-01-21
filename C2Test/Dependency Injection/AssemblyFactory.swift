//
//  AssemblyFactory.swift
//  C2Test
//
//  Created by Or Menashe on 21/01/2019.
//

import UIKit
import Swinject

class Factory {
    var container: Container
    
    init(container: Container) {
        self.container = container
    }
}

class DisplayPhotoVCFactory: Factory {
    func create(photoItem: PhotoItem) -> DisplayPhotoVC {
        let viewModel = self.container.resolve(DisplayPhotoViewModelType.self, argument: photoItem)!
        let displayPhotoVC = self.container.resolve(DisplayPhotoVC.self, argument: viewModel)!
        return displayPhotoVC
    }
}
