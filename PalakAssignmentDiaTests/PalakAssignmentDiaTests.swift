//
//  PalakAssignmentDiaTests.swift
//  PalakAssignmentDiaTests
//
//  Created by Palak jain on 07/05/20.
//  Copyright © 2020 Palak jain. All rights reserved.
//

import XCTest
@testable import PalakAssignmentDia

class PalakAssignmentDiaTests: XCTestCase {
     var controller: ListViewController!
   
     override func setUp() {
    
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
      controller = navigationController.topViewController as? ListViewController
      XCTAssertNotNil(navigationController.view)
      XCTAssertNotNil(controller.view)
     
     }

   func testcollectionview(){
     XCTAssertNotNil(controller.colView)
   }
  func testcollectionViewDataSourceProtocol() {
      XCTAssertTrue(controller.conforms(to: UICollectionViewDataSource.self))
      XCTAssertTrue(controller.responds(to: #selector(controller.collectionView(_:numberOfItemsInSection:))))
      XCTAssertTrue(controller.responds(to: #selector(controller.collectionView(_:cellForItemAt:))))
  }
  
  func testCollectionViewCell() {
      let indexPath = IndexPath(row: 0, section: 0)
      let cell = controller.collectionView(controller.colView, cellForItemAt: indexPath) as! ListCollCell
      XCTAssertNotNil(cell)
      let view = cell.contentView
      XCTAssertNotNil(view)
  }
  
  func testCollectionViewCellHasReuseIdentifier() {
    

    let cell = controller.collectionView(controller.colView, cellForItemAt: IndexPath(row: 0, section: 0)) as? ListCollCell
      let actualReuseIdentifer = cell?.reuseIdentifier
      let expectedReuseIdentifier = "cell"
      XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
  }
  
  
}
