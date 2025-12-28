//
//  ListeViewController.swift
//  Goal Tracker Mini-Project
//
//  Created by Tufan Akbaş on 27.12.2025.
//

import UIKit

class ListeViewController: UIViewController {
    
    var gelenHarcamalar: [Harcama] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("İkinci ekrana gelen harcama sayısı: \(gelenHarcamalar.count)")
        
    }
    


}
