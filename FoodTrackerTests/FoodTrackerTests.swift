//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Austin on 8/1/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import XCTest
import UIKit
//@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
  // MARK: FoodTracker Tests
    
    // Test case
    func testMealInitialization(){
    
        
        // Success case
        let potentialItem = Meal(name: "new", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        //failure cases
        
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName, "Empty name is invalid")
        
        let badRating = Meal(name: "Badrating", photo: nil, rating: -1)
        XCTAssertNil(badRating)
        
        
    }
    
  
    
}
