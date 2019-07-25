//
//  FlickrPhotosViewController.swift
//  ios13test
//
//  Created by Vladimir Amiorkov on 25.07.19.
//  Copyright © 2019 Vladimir Amiorkov. All rights reserved.
//

import UIKit

final class FlickrPhotosViewController: UICollectionViewController {
    // MARK: - Properties
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    private let reuseIdentifier = "FlickrCell"
    
    private let itemsPerRow: CGFloat = 1
    
    override func viewWillLayoutSubviews() {
        layout.estimatedItemSize = CGSize(width: 100, height: 100)
    }
}

// MARK: - UICollectionViewDataSource
extension FlickrPhotosViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
        ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! FlickPhotoCell
        
        cell.label1.text = "Item " + String(indexPath.row)
        cell.label2.text = "Description " + String(indexPath.row)
        
        return cell
    }
}

// MARK: - Collection View Flow Layout Delegate
extension FlickrPhotosViewController : UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
    //3
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets {
//        return sectionInsets
//    }
//    
//    // 4
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return sectionInsets.left
//    }
}

