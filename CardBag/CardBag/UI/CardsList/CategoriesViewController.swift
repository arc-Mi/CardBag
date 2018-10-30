//
//  CategoriesViewController.swift
//  CardBag
//
//  Created by Admin on 25.10.2018.
//  Copyright © 2018 arcMi. All rights reserved.
//

import UIKit


class CategoriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tblCategories: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell", for: indexPath) as! MyCustomCell
        cell.textF.text = categArray[indexPath.row]
        return cell
    }
    
    func setupSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Поиск категории"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    var categArray: Array = ["Одежда и обувь", "Супермаркеты", "Красота", "Автомобиль"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "MyCustomCell", bundle: nil)
        tblCategories.tableFooterView = UIView(frame: .zero)
        self.tblCategories.register(nib, forCellReuseIdentifier: "MyCustomCell")
        navigationItem.title = "Выбрать категорию"
        setupSearchBar()
        // Do any additional setup after loading the view.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}
