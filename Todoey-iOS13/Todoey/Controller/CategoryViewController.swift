//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Md. Mahinur Rahman on 7/31/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class CategoryViewController: SwipeTableViewController{
    
    lazy var realm = try! Realm()
    var categories: Results<Category>?
    
    //coredata
//    var categoryArray = [Category]()
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
        
        tableView.rowHeight = 70.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let bar = UINavigationBarAppearance()
        bar.backgroundColor = UIColor(hexString: "1D9BF6")
        navigationController?.navigationBar.standardAppearance = bar
        navigationController?.navigationBar.compactAppearance = bar
        navigationController?.navigationBar.scrollEdgeAppearance = bar
        navigationController?.navigationBar.tintColor = UIColor.white
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add Category", message: "", preferredStyle: .alert)
        var textField = UITextField()
        
        let action = UIAlertAction(title: "Add", style: .default){(action) in
            if let text = textField.text{
                if text != ""{
                    let category = Category()
                    category.title = text
                    self.saveCategories(category)
                    
                    //not necessary as in realm Results is auto updating container
//                    self.categoryArray.append(category)
                }
            }
        }
        
        alert.addTextField{(alertTextField) in
            alertTextField.placeholder = "Aa.."
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true)
    }

    
    //MARK: - Table View Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        if let category = categories?[indexPath.row]{
            cell.textLabel?.text = category.title
            cell.backgroundColor = UIColor(hexString: category.backgroundColor)
            cell.textLabel?.textColor = UIColor.init(contrastingBlackOrWhiteColorOn: cell.backgroundColor!, isFlat: true)
        }else{
            cell.textLabel?.text = "No Categories added yet"
        }
        
        return cell
    }
    
    //MARK: - Table View Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if categories != nil{
            performSegue(withIdentifier: K.goToItemsSegue, sender: self)
            tableView.deselectRow(at: indexPath, animated: true)
        }else{
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    //MARK: - Preparation for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        if let indexPath = tableView.indexPathForSelectedRow{
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    //MARK: - Data Manipulation Methods
    
    func saveCategories(_ category: Category){
        do{
            try realm.write({
                realm.add(category)
            })
        }catch{
            print("found error while writing in realm \(error)")
        }
        self.tableView.reloadData()
    }
    
    func loadCategories(){
        categories = realm.objects(Category.self)
        
        self.tableView.reloadData()
    }
    
    override func updateModel(at indexPath: IndexPath){
        if let category = self.categories?[indexPath.row]{
            do{
                try realm.write {
                    //delete related items first, as you wouldn't be able to after deleting category itself
                    realm.delete(category.items)
                    realm.delete(category)
                }
            }catch{
                print("Error while deleting category \(error)")
            }
        }
    }
    
    //applicable for CodeData
//    func saveCategories(){
//        do{
//            try context.save()
//            self.tableView.reloadData()
//        }catch{
//            print(error)
//        }
//    }
    
//    func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()){
//        do{
//            categoryArray = try context.fetch(request)
//            self.tableView.reloadData()
//        }catch{
//            print(error)
//        }
//    }
    
//    func deleteCategory(at index:Int){
//        context.delete(categoryArray[index])
//        categoryArray.remove(at: index)
//
//        saveCategories()
//    }
}
