//
//  AboutTableViewCell.swift
//  DynamicStaticCell
//
//  Created by Ethan on 2020/2/1.
//  Copyright © 2020 playplay. All rights reserved.
//

import UIKit

class AboutTableViewCell: UITableViewCell {

    @IBOutlet weak var aboutLabel: UILabel!
    
    var item: ProfileViewModelItem? {
       didSet {
          guard  let item = item as? ProfileViewModelAboutItem else {
             return
          }
          aboutLabel?.text = item.about
       }
    }

    

    
}
