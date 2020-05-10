//
//  JSONTests.swift
//  PalakAssignmentTests
//
//  Created by Palak jain on 11/04/20.
//  Copyright © 2020 Palak jain. All rights reserved.
//

import XCTest

@testable import PalakAssignmentDia

class JSONTests: XCTestCase {
  
  
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  func testFromJsonFile(){
    
    if let path = Bundle.main.path(forResource: "CONTENTLISTINGPAGE-PAGE1", ofType: "json"){
      
      do {
        guard let jsonString = try? String(contentsOfFile: path, encoding: .isoLatin1) else {
          fatalError("Unable to convert fact.json to String")
        }
        
        print("The JSON string is: \(jsonString)")
        
        guard let jsonData = jsonString.data(using: .utf8) else {
          fatalError("Unable to convert fact.json to Data")
        }
        
        guard let jsonDictionary = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String:Any] else {
          fatalError("Unable to convert fact.json to JSON dictionary")
        }
        let actualResponse = PageRootModel(fromDictionary: jsonDictionary )
        XCTAssertEqual(actualResponse.page.contentitems.content.count, 20)
        XCTAssertEqual(actualResponse.page.title, "Romantic Comedy")
        XCTAssertEqual(actualResponse.page.pagenum, "1")
        XCTAssertEqual(actualResponse.page.pagesize, "20")
        XCTAssertEqual(actualResponse.page.totalcontentitems, "54")
        XCTAssertEqual(actualResponse.page.contentitems.content[0].name, "The Birds")
        XCTAssertEqual(actualResponse.page.contentitems.content[0].posterimage,"poster1.jpg")
        
      }
    }
  }
  
  
}

