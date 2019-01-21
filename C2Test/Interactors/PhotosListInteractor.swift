//
//  PhotosListInteractor.swift
//  C2Test
//
//  Created by Or Menashe on 21/01/2019.
//

import UIKit
import Alamofire

protocol PhotosListInteractorType {
    var delegate: PhotosListInteractorDelegate? {get set}
    func getAllPhotos()
}

protocol PhotosListInteractorDelegate: class {
    func photosListArrived(photosList: [PhotoItem])
}

class PhotosListInteractor: PhotosListInteractorType {
    weak var delegate: PhotosListInteractorDelegate?

    init() {
        self.getAllPhotos()
    }
    
    func getAllPhotos() {
        
        Alamofire.request("https://jsonplaceholder.typicode.com/photos").responseJSON { [weak self] response in
            guard let responseData = response.data else {
                print("didn't get any data from API")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let photosList = try decoder.decode([PhotoItem].self, from: responseData)
                self?.delegate?.photosListArrived(photosList: photosList)
            } catch {
                print("error trying to decode response")
            }
        }
        
    }
}
