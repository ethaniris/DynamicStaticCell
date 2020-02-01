//
//  AttributeTableViewCell.swift
//  DynamicStaticCell
//
//  Created by Ethan on 2020/2/1.
//  Copyright © 2020 playplay. All rights reserved.
//

import UIKit

class AttributeTableViewCell: UITableViewCell {

    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var item: Attribute?  {
       didSet {
          titleLabel?.text = item?.key
          subtitleLabel?.text = item?.value
       }
    }
        
}
