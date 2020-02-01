//
//  EmailTableViewCell.swift
//  DynamicStaticCell
//
//  Created by Ethan on 2020/2/1.
//  Copyright © 2020 playplay. All rights reserved.
//

import UIKit

class EmailTableViewCell: UITableViewCell {

    @IBOutlet weak var emailLabel: UILabel!
    
    var item: ProfileViewModelItem? {
         didSet {
            guard let item = item as? ProfileViewModelEmailItem else {
               return
            }
            emailLabel?.text = item.email
         }
      }
    

}
