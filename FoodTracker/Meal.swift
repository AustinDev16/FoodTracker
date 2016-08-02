//
//  Meal.swift
//  FoodTracker
//
//  Created by Austin on 8/1/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import Foundation
import UIKit

class Meal: NSObject, NSCoding {
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int

    //MARK: Types
    
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
    }
    
    // MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
        aCoder.encodeObject(rating, forKey: PropertyKey.ratingKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder){
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        let rating = aDecoder.decodeObjectForKey(PropertyKey.ratingKey) as! Int
        
        //Call designated init
        self.init(name: name, photo: photo, rating: rating)
    }
    
    // MARK: Archiving paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int){
        self.name = name
        self.photo = photo
        self.rating = rating
        
        super.init()
        
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
    
}
