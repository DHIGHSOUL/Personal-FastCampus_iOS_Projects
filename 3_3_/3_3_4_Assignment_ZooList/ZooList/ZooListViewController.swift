//
//  ViewController.swift
//  ZooList
//
//  Created by ROLF J. on 2023/04/02.
//

import UIKit

class ZooListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let animalList: [Animal] = Animal.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension ZooListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animalList.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZooListCollectionViewCell", for: indexPath) as? ZooListCollectionViewCell else { return UICollectionViewCell() }
        
        let animal = animalList[indexPath.item]
        cell.configure(animal)
        
        return cell
    }
}

extension ZooListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}
