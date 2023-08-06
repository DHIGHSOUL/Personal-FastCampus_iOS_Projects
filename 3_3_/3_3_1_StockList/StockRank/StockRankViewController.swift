//
//  StockRankViewController.swift
//  StockRank
//
//  Created by ROLF J. on 2023/04/01.
//

import UIKit

class StockRankViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    // Data, Presentation, Layout
    
    // DATA
    let stockList: [StockModel] = StockModel.list
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        // dataSource & delegate는 protocol의 일종임.
    }

}

extension StockRankViewController: UICollectionViewDataSource {
    
    // DataSource protocol을 준수하기 위해 반드시 필요한 메소드(프로토콜에 필수로 지정되어 있음)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stockList.count
    }
    
    // Cell이 몇 번째의 아이템인가?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // PRESENTATION
        // StockRankCollectionViewCell은 UICollectionViewCell을 상속받은 클래스이므로,
        // StockRankCollectionViewCell에 맞게 Casting을 시켜주어야 한다.
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockRankCollectionViewCell", for: indexPath) as? StockRankCollectionViewCell else { return UICollectionViewCell() }
        // Guard문을 사용하여 ReusableCell을 가져올 때, 캐스팅이 성공되었을 때 cell을 사용할 수 있도록 한다.
        
        // -> indexPath를 통해 몇 번째 Cell인지 알려준다.
        let stock = stockList[indexPath.item]
        cell.configure(stock)
        return cell
        
    }
    
    
}

extension StockRankViewController: UICollectionViewDelegateFlowLayout {
    // LAYOUT
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // width == collectionView, height == 80
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
}
