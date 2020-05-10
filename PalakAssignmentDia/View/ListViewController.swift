//
//  ListViewController.swift
//  PalakAssignmentDia
//
//  Created by Palak jain on 08/05/20.
//  Copyright © 2020 Palak jain. All rights reserved.
//

import UIKit
import Foundation

class ListViewController: UIViewController {
  
  //MARK: IBOutlets
  @IBOutlet var colView: UICollectionView!
  let presenter = PagePresenter()
   let refreshControl = UIRefreshControl()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.pageProtocol = self
    presenter.getPageData()
    colView.refreshControl = refreshControl
    refreshControl.tintColor = UIColor.white
    refreshControl.addTarget(self, action: #selector(refreshAPIData(_:)), for: .valueChanged)
   
  }
  @objc private func refreshAPIData(_ sender: Any) {
    print(loadNumber)
    loadNumber = 1
    presenter.getPageData()
    
  }
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    
    self.view.layoutIfNeeded()
    colView.reloadData()
    
  }
  
  
}

extension ListViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return presenter.rootClass.page.contentitems.content.count
    
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ListCollCell
    if indexPath.row == presenter.rootClass.page.contentitems.content.count - 1 {
      loadNumber += 1
      if loadNumber < 4{
        presenter.getPageData()
      }
    }
    let obj = presenter.rootClass.page.contentitems.content[indexPath.row]
    cell.setupDataFromModel(obj: obj)
    return cell
    
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let noOfCellsInRow = 3  //number of column you want
    let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
    let totalSpace = flowLayout.sectionInset.left
      + flowLayout.sectionInset.right
      + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
    let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
    let height = (collectionView.bounds.height / 3)
    return CGSize(width: size, height: Int(height))
    
    
  }
}

extension ListViewController: PagePresenterProtocol{
  
  func loadCollectionView() {
    self.refreshControl.endRefreshing()
    self.refreshControl.isHidden = true
    colView.reloadData()
  }
  func setTopNavigation(){
    self.title = presenter.rootClass.page.title
    let searchBarButtonItem = UIBarButtonItem(image: UIImage(named: "search"), style: .done, target: self, action: nil)
    let backBarButtonItem = UIBarButtonItem(image: UIImage(named: "Back"), style: .done, target: self, action: nil)
    self.navigationItem.leftBarButtonItem  = backBarButtonItem
    self.navigationItem.rightBarButtonItem  = searchBarButtonItem
    self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
    self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
    self.navigationController?.navigationBar.layer.shadowRadius = 4.0
    self.navigationController?.navigationBar.layer.shadowOpacity = 0.5
    self.navigationController?.navigationBar.layer.masksToBounds = false
  }
  
  
  
  
  
  
  
}
