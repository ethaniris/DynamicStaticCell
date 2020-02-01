//
//  NamePictureTableViewCell.swift
//  DynamicStaticCell
//
//  Created by Ethan on 2020/2/1.
//  Copyright © 2020 playplay. All rights reserved.
//

import UIKit

class NamePictureTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var pictureImageView: UIImageView!

    var item: ProfileViewModelItem? {
       didSet {
          // cast the ProfileViewModelItem to appropriate item type
          guard let item = item as? ProfileViewModelNamePictureItem  else {
             return
          }
        nameLabel?.text = item.userName
        pictureImageView?.image = UIImage(named: item.pictureUrl)
       }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        pictureImageView.frame = CGRect(x: 5, y: 5, width: 80, height: 80)
    }
    

    
}
