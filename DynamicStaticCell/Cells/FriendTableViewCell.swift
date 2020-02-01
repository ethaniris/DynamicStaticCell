//
//  FriendTableViewCell.swift
//  DynamicStaticCell
//
//  Created by Ethan on 2020/2/1.
//  Copyright © 2020 playplay. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pictureImageView: UIImageView!
    
    
    var item: Friend? {
        didSet {
           guard let item = item  else {
              return
           }
            if let pictureUrl = item.pictureUrl {
              pictureImageView?.image = UIImage(named: pictureUrl)
           }
           nameLabel?.text = item.name
        }
     }
    

}
