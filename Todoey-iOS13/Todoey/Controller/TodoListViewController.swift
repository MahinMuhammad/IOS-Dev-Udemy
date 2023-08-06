//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class TodoListViewController: SwipeTableViewController {
    
    let realm = try! Realm()
    var items: Results<Item>?
    
    //for CoreData
//    var itemArray = [Item]()
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var selectedCategory: Category?{
        didSet{
            loadItems()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        tableView.rowHeight = 60.0
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let colorHex = selectedCategory?.backgroundColor{
            
            let bar = UINavigationBarAppearance()
            bar.backgroundColor = UIColor(hexString: colorHex)
            navigationController?.navigationBar.standardAppearance = bar
            navigationController?.navigationBar.compactAppearance = bar
            navigationController?.navigationBar.scrollEdgeAppearance = bar
            navigationController?.navigationBar.tintColor = UIColor.white
            title = selectedCategory!.title
            
            searchBar.barTintColor = UIColor(hexString: colorHex)
            searchBar.tintColor = UIColor.gray
            searchBar.searchTextField.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Task", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default){(action) in
            if let text = textField.text{
                if text != ""{
                    let item = Item()
                    item.title = text
//                    self.itemArray.append(item)
                    self.saveItems(item)
                }
            }
        }
        
        alert.addTextField{ (alertTextField) in
            alertTextField.placeholder = "Aa.."
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Data Manipulation Methods
    
    func saveItems(_ item: Item){
        do{
            try realm.write({
                selectedCategory?.items.append(item) //adding this item to parentCategory
            })
        }catch{
            print("found error while writing in realm \(error)")
        }
        loadItems()
    }
    
    func loadItems(){
        items = selectedCategory?.items.sorted(byKeyPath: K.Queries.dateCreated, ascending: true)
        tableView.reloadData()
    }
    
    func deleteItem(_ item:Item){
        do{
            try realm.write({
                realm.delete(item)
            })
        }catch{
            print("error while deleting realm item \(error)")
        }
    }
    
    override func updateModel(at indexPath: IndexPath) {
        if let item = items?[indexPath.row]{
            do{
                try realm.write({
                    realm.delete(item)
                })
            }catch{
                print("error while deleting realm item \(error)")
            }
        }
    }
    
    //for CoreData
//    func saveItems(){
//        do{
//            try context.save()
//            tableView.reloadData()
//        }catch{
//            print(error)
//        }
//    }
//
//    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest(), when titlePerdicate: NSPredicate? = nil ){
//
//        let categoryPredicate = NSPredicate(format: K.Queries.parentCategoryMatches, selectedCategory!.title!)
//
//        if let safeTitlePredicate = titlePerdicate{
//            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, safeTitlePredicate])
//        }else{
//            request.predicate = categoryPredicate
//        }
//
//        do{
//            itemArray = try context.fetch(request)
//            tableView.reloadData()
//        }catch{
//            print(error)
//        }
//    }
//
//    func deleteItem(at index:Int){
//        context.delete(itemArray[index])
//        itemArray.remove(at: index)
//
//        saveItems()
//    }
}

//MARK: - TableView Data Source

extension TodoListViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        if let item = items?[indexPath.row]{
            cell.accessoryType = item.done ? .checkmark : .none
            cell.textLabel?.text = item.title
            cell.backgroundColor = UIColor(hexString: item.backgroundColor)
            cell.textLabel?.textColor = UIColor.init(contrastingBlackOrWhiteColorOn: cell.backgroundColor!, isFlat: true)
        }else{
            cell.textLabel?.text = "No item added yet"
        }
        
        return cell
    }
    
}

//MARK: - TableView Delegate Methods

extension TodoListViewController{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let item = items?[indexPath.row]{
            do{
                try realm.write({
//                    item.done.toggle()
                    realm.delete(item)
                })
            }catch{
                print("erro while toggling done \(error)")
            }
            tableView.reloadData()
        }
        
            //only for CoreData
//        saveItems(items[indexPath.row])

        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - UISearchBar Delegate Methods

extension TodoListViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text{
            if text != ""{
                items = items?.filter(K.Queries.titleContains, text).sorted(byKeyPath: K.Queries.dateCreated)
                tableView.reloadData()
//                let request: NSFetchRequest<Item> = Item.fetchRequest()
//
//                let predicate = NSPredicate(format: K.Queries.titleContains, text)
//
//                request.sortDescriptors = [NSSortDescriptor(key: K.Queries.title, ascending: true)]
//
//                loadItems(with: request, when: predicate)
            }
        }
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == ""{
            print("Ok")
            loadItems()

            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}
