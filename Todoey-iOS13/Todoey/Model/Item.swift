//
//  Item.swift
//  Todoey
//
//  Created by Md. Mahinur Rahman on 8/3/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift
import ChameleonFramework

class Item: Object {
    @Persisted var title: String = ""
    @Persisted var done:Bool = false
    @Persisted var dateCreated = Date()
    @Persisted var backgroundColor = UIColor.randomFlat().hexValue()
    
    //inverse relation
    @Persisted(originProperty: "items") var parentCategory: LinkingObjects<Category>
}
