//
//  ListeViewController.swift
//  Goal Tracker Mini-Project
//
//  Created by Tufan Akbaş on 27.12.2025.
//

import UIKit

class ListeViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var gelenHarcamalar: [Harcama] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.title = "Harcama Geçmişi"
        
    }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return gelenHarcamalar.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "HarcamaCell", for: indexPath)
            
            let harcama = gelenHarcamalar[indexPath.row]
            
            cell.textLabel?.text = harcama.kategori
            
            cell.detailTextLabel?.text = "\(harcama.miktar) TL"
            
            return cell
        }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        
        if editingStyle == .delete {
            
            gelenHarcamalar.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            print("Bir harcama silindi. Kalan: \(gelenHarcamalar.count)")
        }
    }
    


}
