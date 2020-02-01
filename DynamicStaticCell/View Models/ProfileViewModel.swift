//
//  ProfileViewModel.swift
//  DynamicStaticCell
//
//  Created by Ethan on 2020/2/1.
//  Copyright © 2020 playplay. All rights reserved.
//

import Foundation
import UIKit

//做好分類
enum ProfileViewModelItemType{
    case nameAndPicture
    case about
    case email
    case friend
    case attribute
}

//使用在同一個tableView裡所以用同一個協定
protocol ProfileViewModelItem {
    var type: ProfileViewModelItemType { get }
    var rowCount: Int { get }
    var sectionTitle: String  { get }
}

//給協定一些預設值
extension ProfileViewModelItem {
    var rowCount: Int {
        return 1
    }
}

//第一個符合協定的 item, 以協定為class type
class ProfileViewModelNamePictureItem: ProfileViewModelItem {
    var type: ProfileViewModelItemType {
        return .nameAndPicture
    }
    var sectionTitle: String {
        return "Main Info"
    }
    //rowCount不用
    
    //這個vm裡獨有的property
    var pictureUrl: String
    var userName: String
    
    init(pictureUrl: String, name: String) {
        self.pictureUrl = pictureUrl
        self.userName = name
    }
}

// item 2
class ProfileViewModelAboutItem: ProfileViewModelItem {
   var type: ProfileViewModelItemType {
      return .about
   }
   var sectionTitle: String {
      return "About"
   }
   var about: String
  
   init(about: String) {
      self.about = about
   }
}

// item 3
class ProfileViewModelEmailItem: ProfileViewModelItem {
   var type: ProfileViewModelItemType {
      return .email
   }
   var sectionTitle: String {
      return "Email"
   }
   var email: String
   init(email: String) {
      self.email = email
   }
}


// item 4
class ProfileViewModeAttributeItem: ProfileViewModelItem {
   var type: ProfileViewModelItemType {
      return .attribute
   }
   var sectionTitle: String {
      return "Attributes"
   }
 
   var rowCount: Int {
      return attributes.count
   }
   var attributes: [Attribute]
   init(attributes: [Attribute]) {
      self.attributes = attributes
   }
}

// item 5
class ProfileViewModeFriendsItem: ProfileViewModelItem {
   var type: ProfileViewModelItemType {
      return .friend
   }
   var sectionTitle: String {
      return "Friends"
   }
   var rowCount: Int {
      return friends.count
   }
   var friends: [Friend]
   init(friends: [Friend]) {
      self.friends = friends
   }
}


// 給tableView使用的vm
class ProfileViewModel: NSObject {
   var items = [ProfileViewModelItem]()

    override init() {
        super.init()
        
        //在struct裡面已經decode jsonData
        guard let data = dataFromFile("ServerData"), let profile = Profile(data: data) else {
           return
        }
        
        //有data後直接在這裡initialize
        if let name = profile.fullName, let pictureUrl = profile.pictureUrl {
           let nameAndPictureItem = ProfileViewModelNamePictureItem(pictureUrl: pictureUrl, name: name)
           items.append(nameAndPictureItem)
        }
        if let about = profile.about {
           let aboutItem = ProfileViewModelAboutItem(about: about)
           items.append(aboutItem)
        }
        if let email = profile.email {
           let dobItem = ProfileViewModelEmailItem(email: email)
           items.append(dobItem)
        }
        let attributes = profile.profileAttributes
        // we only need attributes item if attributes not empty
        if !attributes.isEmpty {
           let attributesItem = ProfileViewModeAttributeItem(attributes: attributes)
           items.append(attributesItem)
        }
        let friends = profile.friends
        // we only need friends item if friends not empty
        if !profile.friends.isEmpty {
           let friendsItem = ProfileViewModeFriendsItem(friends: friends)
           items.append(friendsItem)
        }
        
        //這樣寫, 所有的item都可以在array裡任意的移動index
    }
}

extension ProfileViewModel: UITableViewDataSource, UITableViewDelegate {
   func numberOfSections(in tableView: UITableView) -> Int {
      return items.count
   }
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return items[section].rowCount
   }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
  
        let item = items[indexPath.section]
     
     switch item.type {
         
     case .about:
         return 44
     case .nameAndPicture:
         return 100
     case .attribute:
         return 44
     case .friend:
         return 100
     case .email:
         return 44
         
     }
        
    }
    
  
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   // we will configure the cells here
    
    let item = items[indexPath.section]
    
    switch item.type {
    case .nameAndPicture:
       if let cell = tableView.dequeueReusableCell(withIdentifier: "namePictureTableViewCell", for: indexPath) as? NamePictureTableViewCell {
          cell.item = item
          return cell
       }
    case .about:
       if let cell = tableView.dequeueReusableCell(withIdentifier: "aboutTableViewCell", for: indexPath) as? AboutTableViewCell {
          cell.item = item
          return cell
       }
    case .email:
       if let cell = tableView.dequeueReusableCell(withIdentifier: "emailTableViewCell", for: indexPath) as? EmailTableViewCell {
          cell.item = item
          return cell
       }
    case .friend:
       if let cell = tableView.dequeueReusableCell(withIdentifier: "friendTableViewCell", for: indexPath) as? FriendTableViewCell {
        
        if let friendItems = item as? ProfileViewModeFriendsItem{
            cell.item = friendItems.friends[indexPath.row]
            
        }
          
       
          return cell
       }
    case .attribute:
       if let cell = tableView.dequeueReusableCell(withIdentifier: "attributeTableViewCell", for: indexPath) as? AttributeTableViewCell {
        
    
        if let attributeItems = item as? ProfileViewModeAttributeItem {
            cell.item = attributeItems.attributes[indexPath.row]
        }
       
          return cell
       }
    }
    
    return UITableViewCell()
    
   }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let item = items[section]
        
        switch item.type {
            
        case .about:
            return item.sectionTitle
        case .nameAndPicture:
            return item.sectionTitle
        case .attribute:
            return item.sectionTitle
        case .friend:
            return item.sectionTitle
        case .email:
            return item.sectionTitle
            
        }
        
    }
}
