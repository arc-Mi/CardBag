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
        
        changeTextButton.setTitle("Обновить текст", for: .normal)
        updateSampleLabel()
    }
    
    // MARK: - Приватные методы
    
    private func updateSampleLabel() {
        sampleLabel.text = "Кол-во обновлений: \(labelUpdatesCount)"
        labelUpdatesCount += 1
    }

    // MARK: - Методы экшенов
    
    @IBAction func onChangeTextButton(_ sender: Any) {
        updateSampleLabel()
    }

}
