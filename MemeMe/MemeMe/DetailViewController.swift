//
//  DetailViewController.swift
//  MemeMe
//
//  Created by Jiyoon on 2017. 1. 21..
//  Copyright © 2017년 Jiyoon. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var meme : Meme?
    @IBOutlet weak var detailImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        if let meme = meme {
            detailImageView.image = meme.memedImage
        }
    }
}
