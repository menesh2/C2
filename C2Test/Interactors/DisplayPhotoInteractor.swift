//
//  DisplayPhotoInteractor.swift
//  C2Test
//
//  Created by Or Menashe on 21/01/2019.
//

import UIKit
import Alamofire
import AlamofireImage

protocol DisplayPhotoInteractorType {
    var delegate: DisplayPhotoInteractorDelegate? {get set}
    func getImageFromURl(imageUrl: String)
}

protocol DisplayPhotoInteractorDelegate: class {
    func imageArrived(_ image: UIImage)
}

class DisplayPhotoInteractor: DisplayPhotoInteractorType {
    weak var delegate: DisplayPhotoInteractorDelegate?
    
    init() {
        
    }
    
    func getImageFromURl(imageUrl: String) {
        Alamofire.request(imageUrl, method: .get).responseImage { [weak self] response in
            guard let image = response.result.value else {
                print("could not load image from url: \(imageUrl)")
                return
            }
            self?.delegate?.imageArrived(image)
        }
    }
}
