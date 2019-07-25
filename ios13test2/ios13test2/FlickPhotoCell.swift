//
//  FlickrPhotoCell.swift
//  ios13test
//
//  Created by Vladimir Amiorkov on 25.07.19.
//  Copyright © 2019 Vladimir Amiorkov. All rights reserved.
//

import UIKit

class FlickPhotoCell: UICollectionViewCell {
    
    
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label1: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blue
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initBackgroundColor()
    }
    
    func initBackgroundColor() {
        self.backgroundColor = UIColor.blue
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize) -> CGSize {
        return CGSize(width: 50, height: 200)
    }
}
