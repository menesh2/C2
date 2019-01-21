//
//  Assembly.swift
//  C2Test
//
//  Created by Or Menashe on 21/01/2019.
//

import UIKit
import Swinject
import SwinjectAutoregistration

class Assembly {
    
    let container = Container()
    
    init(){
        self.registerEntities()
    }
    
    private func registerEntities() {
        
        self.container.register(Container.self) { [unowned self] _ in
            return self.container
        }
        
        //MARK: - Factory registration
        self.container.autoregister(DisplayPhotoVCFactory.self, initializer: DisplayPhotoVCFactory.init)
        
        // MARK: - VC registration
        self.container.autoregister(PhotosListVC.self, initializer: PhotosListVC.init)
        self.container.autoregister(DisplayPhotoVC.self, argument: DisplayPhotoViewModelType.self, initializer: DisplayPhotoVC.init)
        
        //MARK: - ViewModels registration
        self.container.autoregister(PhotosListViewModelType.self, initializer: PhotosListViewModel.init)
        self.container.autoregister(DisplayPhotoViewModelType.self, argument: PhotoItem.self, initializer: DisplayPhotoViewModel.init)
        
        //MARK: - Interactors registration
        self.container.autoregister(PhotosListInteractorType.self, initializer: PhotosListInteractor.init)
        self.container.autoregister(DisplayPhotoInteractorType.self, initializer: DisplayPhotoInteractor.init)
    }
    
    func getRootViewController() -> UIViewController {
        guard let photosListVC = self.container.resolve(PhotosListVC.self) else {
            return UIViewController()
        }
        
        return photosListVC
    }
}
