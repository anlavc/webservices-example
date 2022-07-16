//
//  Util.swift
//  json-webservis-learning
//
//  Created by Anıl AVCI on 16.07.2022.
//

import Foundation
import UIKit

//1. adım
class Util {
    static var app: Util = {
        return Util()
    }()
    // bir tane uıimage alıyor max wight ve heigt gönderiyor. bu girilen değerlere göre bir tane image döndürür. oranları hesplayın yeni bir foto oluşturuyor.
    func resizeImageWithAspect(image: UIImage,scaledToMaxWidth width:CGFloat,maxHeight height :CGFloat)->UIImage? {
        let oldWidth = image.size.width;
        let oldHeight = image.size.height;

        let scaleFactor = (oldWidth > oldHeight) ? width / oldWidth : height / oldHeight;

        let newHeight = oldHeight * scaleFactor;
        let newWidth = oldWidth * scaleFactor;
        let newSize = CGSize(width: newWidth, height: newHeight)

        UIGraphicsBeginImageContextWithOptions(newSize,false,UIScreen.main.scale);

        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height));
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage
    }
}


