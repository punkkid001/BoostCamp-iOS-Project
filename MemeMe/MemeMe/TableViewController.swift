//
//  TableViewController.swift
//  MemeMe
//
//  Created by Jiyoon on 2017. 1. 21..
//  Copyright © 2017년 Jiyoon. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {
    var memes = [Meme]()
    
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        cell.tableImageView?.contentMode = .scaleAspectFit
        cell.tableImageView?.image = memes[indexPath.row].memedImage as UIImage
        cell.tableTitle?.text = "\(memes[indexPath.row].top)...\(memes[indexPath.row].bottom)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailController.meme = memes[indexPath.row]
        navigationController!.pushViewController(detailController, animated: true)
    }
}
