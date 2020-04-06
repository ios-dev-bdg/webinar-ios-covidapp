//
//  HomeVC.swift
//  covid-webinar-app
//
//  Created by IRFAN TRIHANDOKO on 02/04/20.
//  Copyright © 2020 Muhammad Arif. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var backgroundView: UIView!
    
    let localStatusData = [["1450", "POSITIF"], ["1290", "DALAM PERAWATAN"], ["90", "SEMBUH"], ["112", "MENINGGAL"]]
    let worldStatusData = [["787.238", "POSITIF"], ["37.800", "MENINGGAL"], ["238.000", "SEMBUH"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func configureView() {
        backgroundView.roundCorners(with: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner], radius: 10)
        
        collectionView.register(UINib(nibName: "TitleCell", bundle: nil), forCellWithReuseIdentifier: "TitleCell")
        collectionView.register(UINib(nibName: "LocalStatusCell", bundle: nil), forCellWithReuseIdentifier: "LocalStatusCell")
        collectionView.register(UINib(nibName: "SectionWorldStatusCell", bundle: nil), forCellWithReuseIdentifier: "SectionWorldStatusCell")
        collectionView.register(UINib(nibName: "WorldStatusCell", bundle: nil), forCellWithReuseIdentifier: "WorldStatusCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 1:
            return localStatusData.count
        case 2:
            return 1
        case 3:
            return worldStatusData.count
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LocalStatusCell", for: indexPath) as? LocalStatusCell
            let data = localStatusData[indexPath.item]
            cell?.setupData(data: data)
            return cell ?? UICollectionViewCell()
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionWorldStatusCell", for: indexPath)
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorldStatusCell", for: indexPath) as? WorldStatusCell
            let data = worldStatusData[indexPath.item]
            cell?.setupData(data: data)
            return cell ?? UICollectionViewCell()
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCell", for: indexPath)
            return cell 
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 1:
            let width = (collectionView.frame.width/2)
            let height = width/1.2
            return CGSize(width: width, height: height)
        case 2:
            let width = collectionView.frame.width
            return CGSize(width: width, height: 40)
        case 3:
            let width = collectionView.frame.width/3
            let height = width/1.2
            return CGSize(width: width, height: height)
        default:
            let width = collectionView.frame.width
            let height = width/2.2
            return CGSize(width: width, height: height)
        }
    }
    
}
