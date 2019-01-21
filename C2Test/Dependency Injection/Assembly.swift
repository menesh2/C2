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
        // MARK: - VC registration
        self.container.autoregister(PhotosListVC.self, initializer: PhotosListVC.init)
        
        //MARK: - ViewModels registration
        self.container.autoregister(PhotosListViewModelType.self, initializer: PhotosListViewModel.init)
        
        //MARK: - Interactors registration
        self.container.autoregister(PhotosListInteractorType.self, initializer: PhotosListInteractor.init)
    }
    
    func getRootViewController() -> UIViewController {
        guard let photosListVC = self.container.resolve(PhotosListVC.self) else {
            return UIViewController()
        }
        
        return photosListVC
    }
}
