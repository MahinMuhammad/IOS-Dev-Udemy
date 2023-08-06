//
//  K.swift
//  Todoey
//
//  Created by Md. Mahinur Rahman on 7/7/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct K{
    static let goToItemsSegue = "goToItems"
    static let cellIdentifier = "Cell"
    static let itemPlistTitle = "Items.plist"
    static let DataModelName = "DataModel"
    
    struct Queries{
        static let titleContains = "title CONTAINS[cd] %@"
        static let parentCategoryMatches = "parentCategory.title MATCHES %@"
        static let title = "title"
        static let dateCreated = "dateCreated"
    }
}
