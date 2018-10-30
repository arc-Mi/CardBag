//
//  AddCardViewController.swift
//  CardBag
//
//  Created by Admin on 23.10.2018.
//  Copyright © 2018 arcMi. All rights reserved.
//

import UIKit

class AddCardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var btnPhoto: UIButton!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return descField.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell", for: indexPath) as! MyCustomCell
        cell.textF.text = descField[indexPath.row]
        return cell
    }
    
    var descField: Array = ["Название карты", "Категория", "Процент скидки"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnPhoto.layer.cornerRadius = 24
        let nib = UINib.init(nibName: "MyCustomCell", bundle: nil)
        btnPhoto.setTitle("Сфотографировать", for: .normal)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onChangeBtn(_ sender: Any) {
        photoFrontPage()
    }
    @IBAction func onChangeCategories(_ sender: Any) {
        categoriesPage()
    }
    
    func photoFrontPage() {
        let nextPage = FrontPhotoViewController()
        navigationController?.pushViewController(nextPage, animated: true)
    }

    func categoriesPage() {
        let categoriesPage = CategoriesViewController()
        navigationController?.pushViewController(categoriesPage, animated: true)
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
