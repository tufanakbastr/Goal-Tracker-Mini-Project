//
//  ViewController.swift
//  Goal Tracker Mini-Project
//
//  Created by Tufan Akbaş on 22.12.2025.
//

import UIKit

class ViewController: UIViewController {
    
    var harcamalarListesi: [Harcama] = []
    @IBOutlet weak var miktarTextField: UITextField!
    @IBOutlet weak var kategoriControl: UISegmentedControl!
    @IBAction func ekleButonTikla(_ sender: Any) {
        
        
        
        if let miktar = miktarTextField.text{
            print("Girilen miktar: \(miktar)")
            let secilenKategori = kategoriControl.titleForSegment(at: kategoriControl.selectedSegmentIndex)
            print("Seçilen kategori: \(secilenKategori  ?? "")")
            
        }
        
        if let miktarMetni = miktarTextField.text, let miktarSayi = Double(miktarMetni){
            let secilenKategori = kategoriControl.titleForSegment(at: kategoriControl.selectedSegmentIndex) ?? ""
            let yeniHarcama = Harcama(miktar: miktarSayi, kategori: secilenKategori, tarih: Date())
            
            harcamalarListesi.append(yeniHarcama)
            var toplam: Double = 0
            for harcama in harcamalarListesi {
                toplam += harcama.miktar
            }
            print("Şu ana kadarki toplam harcama: \(toplam)")
            print("Toplam harcama sayısı: \(harcamalarListesi.count)")
        }else{
            print("Lütfen geçerli bir sayı giriniz!")
        }
        
        let uyariMesaji = UIAlertController(title: "Başarılı", message: "Harcamanız listeye eklendi.", preferredStyle: .alert)
        
        let tamamButonu = UIAlertAction(title: "Tamam", style: .default) { _ in
            self.miktarTextField.text = ""
            self.performSegue(withIdentifier: "toHarcamaListesi", sender: nil)
        }
        uyariMesaji.addAction(tamamButonu)
        self.present(uyariMesaji, animated: true, completion: nil)
        
        
        
        
        
        
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toHarcamaListesi"{
            let gidilecekVC = segue.destination as! ListeViewController
            
            gidilecekVC.gelenHarcamalar = self.harcamalarListesi
        }
    }
    
    
}

struct Harcama {
    var miktar: Double
    var kategori: String
    var tarih: Date
}


