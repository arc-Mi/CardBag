//
//  CardsListViewController.swift
//  CardBag
//
//  Created by Admin on 12.10.2018.
//  Copyright © 2018 arcMi. All rights reserved.
//

import UIKit

class CardsListViewController: UIViewController {

    @IBOutlet weak var changeTextButton: UIButton!
    @IBOutlet weak var sampleLabel: UILabel!
    
    private var labelUpdatesCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add"
        
//        let add = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(updateSampleLabel))
        
        let previous = UIBarButtonItem(image: UIImage(named: "add"), style: .plain, target: self, action: #selector(prevPage))
        let next = UIBarButtonItem(image: UIImage(named: "add"), style: .plain, target: self, action: #selector(nextPage))
        
        navigationItem.leftBarButtonItem = previous
        navigationItem.rightBarButtonItem = next
        
        changeTextButton.setTitle("Обновить текст", for: .normal)
        updateSampleLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // MARK: - Приватные методы
    
    @objc private func updateSampleLabel() {
        sampleLabel.text = "Кол-во обновлений: \(labelUpdatesCount)"
        labelUpdatesCount += 1
    }
    
    @objc private func nextPage() {
        let next = EmptyPageViewController()
        navigationController?.pushViewController(next, animated: true)
    }
    
    @objc private func prevPage() {
        let prev = AddCardViewController()
        let navigation = UINavigationController(rootViewController: prev)
        let closeButton = UIBarButtonItem(image: UIImage(named: "close"), style: .plain, target: self, action: #selector(close))
        
        prev.navigationItem.title = "Таблица"
        prev.navigationItem.leftBarButtonItem = closeButton
        navigationController?.present(navigation, animated: true, completion: nil)
    }
    
    @objc private func close() {
        dismiss(animated: true, completion: nil)
    }

    // MARK: - Методы экшенов
    
    @IBAction func onChangeTextButton(_ sender: Any) {
        updateSampleLabel()
    }

}
