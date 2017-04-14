//
//  Meme.swift
//  MemeMe
//
//  Created by Jiyoon on 2017. 1. 21..
//  Copyright © 2017년 Jiyoon. All rights reserved.
//

import Foundation
import UIKit

struct Meme {
    var top: String
    var bottom: String
    var originalImage: UIImage
    var memedImage: UIImage
    
    init(top: String, bottom: String, originalImage: UIImage, memedImage: UIImage) {
        self.top = top
        self.bottom = bottom
        self.originalImage = originalImage
        self.memedImage = memedImage
    }
}
