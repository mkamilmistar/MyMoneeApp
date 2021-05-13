//
//  AddPenggunaanViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class AddPenggunaanViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {

    @IBOutlet var pemasukanTypeCollection: UICollectionView!
    @IBOutlet weak var pemasukanView: UIView!
    @IBOutlet weak var pengeluaranView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        pemasukanTypeCollection.delegate = self
        pemasukanTypeCollection.dataSource = self
        pemasukanTypeCollection.allowsMultipleSelection = false
        
        let uiNib = UINib(nibName: String(describing: PenggunaanTypeCell.self), bundle: nil)
        pemasukanTypeCollection.register(uiNib, forCellWithReuseIdentifier: String(describing: PenggunaanTypeCell.self))
        
    }
    
    //when select
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = appColor.mainPurple.cgColor
        cell?.layer.borderWidth = 3.0
        cell?.layer.cornerRadius = 8.0
               
        print("cell at #\(indexPath.row) is selected!")
    }
    
    //when deselect
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 0
        cell?.layer.borderColor = UIColor.white.cgColor
        
    }
    
    @IBAction func savePenggunaan(_ sender: UIButton) {
        backNavigation()
    }
    
    @IBAction func backToHome(_ sender: UIButton) {
        backNavigation()
    }
    
    func backNavigation(){
        let mainTabViewController = MainTabController(nibName: "MainTabViewController", bundle: nil)
        
        mainTabViewController.modalPresentationStyle = .fullScreen
        mainTabViewController.modalTransitionStyle = .crossDissolve
        
        self.present(mainTabViewController, animated: false, completion: nil)
    }
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return penggunaanType.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = pemasukanTypeCollection.dequeueReusableCell(withReuseIdentifier: String(describing: PenggunaanTypeCell.self), for: indexPath) as! PenggunaanTypeCell
        
        
        cell.background.layer.cornerRadius = 8.0
        cell.background.layer.shadowColor = UIColor.black.cgColor
        cell.background.layer.shadowOpacity = 0.3
        cell.background.layer.shadowOffset = CGSize(width: 0, height: 1)
      
        
        cell.title.text = penggunaanType[indexPath.row].title
        
        if penggunaanType[indexPath.row].type == .pemasukan {
            cell.imageStatus.image = UIImage(named: "Arrow_Up")
        } else {
            cell.imageStatus.image = UIImage(named: "Arrow_Down")
        }
        
        return cell
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 8, height: 75)
    }
    
}
