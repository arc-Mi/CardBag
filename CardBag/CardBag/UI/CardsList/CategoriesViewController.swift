//
//  CategoriesViewController.swift
//  CardBag
//
//  Created by Admin on 25.10.2018.
//  Copyright © 2018 arcMi. All rights reserved.
//

import UIKit
import Alamofire

class CategoriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tblCategories: UITableView!
    
    struct TestData {
        
        var userId: Int = 0
        var title: String = ""
        var id = 0
        var complited: Bool = false
        
        init (map: [String: AnyObject]) {
            userId = map["userId"] as! Int
            title = map["title"] as! String
            id = map["id"] as! Int
            complited = map["completed"] as! Bool
        }
        
        func show() {
            print ("userId = \(userId)  title = \(title)")
        }
        
    }
    
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
        
        let url = URL(string: "http://cardbag.ru/api/categories")!
        Alamofire.request(url, method: .get).responseJSON { (response) in
            if let d = response.result.value as? [String: AnyObject] {
                let object = TestData(map: d)
                object.show()
            }
        }
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
