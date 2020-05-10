//
//  PageViewModel.swift
//  PalakAssignmentDia
//
//  Created by Palak jain on 10/05/20.
//  Copyright © 2020 Palak jain. All rights reserved.
//

import Foundation

var loadNumber = 1

protocol PagePresenterProtocol: NSObjectProtocol {
  func loadCollectionView()
  func setTopNavigation()
  
}

class PagePresenter{
  weak var pageProtocol : PagePresenterProtocol?
  var rootClass = PageRootModel(fromDictionary: NSDictionary() as! [String : Any])
  
  func getPageData(){
    guard let url = Bundle.main.url(forResource: "CONTENTLISTINGPAGE-PAGE" + "\(loadNumber)", withExtension: "json"), let jsonData = NSData(contentsOf: url) else {
      print("Error finding JSON File")
      return
    }
    let strISOLatin = String(data: jsonData as Data, encoding: .isoLatin1)
    let dataUTF8 = strISOLatin?.data(using: .utf8)
    var dict: Any? = nil
    do {
      if let dataUTF8 = dataUTF8 {
        dict = try JSONSerialization.jsonObject(with: dataUTF8, options: [])
        if loadNumber == 1{
          self.rootClass = PageRootModel(fromDictionary: dict as! [String : Any])
          pageProtocol?.setTopNavigation()
        }
        else{
          let items = ((((dict as! [String:Any])["page"] as! [String:Any])["content-items"] as! [String:Any])["content"] as! NSArray)
          for item in items{
            let value = Content(fromDictionary: item as! [String : Any])
            rootClass.page.contentitems.content.append(value)
          }
        }
        
        DispatchQueue.main.async(execute: {
          self.pageProtocol?.loadCollectionView()
        })
      }
    } catch {
      print("error trying to convert data to JSON")
      return
    }
    
  }
  
}


