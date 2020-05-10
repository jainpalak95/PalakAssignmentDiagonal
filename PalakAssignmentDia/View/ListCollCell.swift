//
//  File.swift
//  PalakAssignmentDia
//
//  Created by Palak jain on 08/05/20.
//  Copyright © 2020 Palak jain. All rights reserved.
//

import Foundation
import UIKit

class ListCollCell: UICollectionViewCell{
  
  @IBOutlet var img: UIImageView!
  @IBOutlet var lblTitle: UILabel!
  
  func setupDataFromModel(obj: Content){
    
    lblTitle.text = obj.name
    img.image = UIImage(named: obj.posterimage)
    lblTitle.textColor = UIColor.white
    
  }
  
  
  
}
