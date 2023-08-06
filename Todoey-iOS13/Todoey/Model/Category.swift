//
//  Category.swift
//  Todoey
//
//  Created by Md. Mahinur Rahman on 8/3/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift
import ChameleonFramework

class Category: Object {
    @Persisted var title:String = ""
    @Persisted var createdDate = Date()
    @Persisted var backgroundColor = UIColor.randomFlat().hexValue()
    
    //relation
    @Persisted var items = List<Item>()
}
