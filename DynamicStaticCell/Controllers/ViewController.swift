//
//  ViewController.swift
//  DynamicStaticCell
//
//  Created by Ethan on 2020/2/1.
//  Copyright © 2020 playplay. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var tableView:UITableView!

    let profileVM = ProfileViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        tableView.dataSource = profileVM
        tableView.delegate = profileVM
        
    
        let nib = UINib(nibName: "NamePictureTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "namePictureTableViewCell")
        let nib2 = UINib(nibName: "FriendTableViewCell", bundle: nil)
           tableView.register(nib2, forCellReuseIdentifier: "friendTableViewCell")
        let nib3 = UINib(nibName: "EmailTableViewCell", bundle: nil)
           tableView.register(nib3, forCellReuseIdentifier: "emailTableViewCell")
        let nib4 = UINib(nibName: "AboutTableViewCell", bundle: nil)
           tableView.register(nib4, forCellReuseIdentifier: "aboutTableViewCell")
        let nib5 = UINib(nibName: "AttributeTableViewCell", bundle: nil)
        
           tableView.register(nib5, forCellReuseIdentifier: "attributeTableViewCell")
        
    }



}

