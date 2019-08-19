# Update 19.08.2019 - Solution/Workaround
Since logging this issue I found a solution/workaround by using the `systemLayoutSizeFitting(_:withHorizontalFittingPriority:verticalFittingPriority:)` method. It still looks that there is an issue in iOS 13 with `systemLayoutSizeFitting` of a `UICollectionViewCell` because this method is no longer being called as it is on iOS 13 and lower. Now you have to override the [systemLayoutSizeFitting(_:withHorizontalFittingPriority:verticalFittingPriority:)](https://developer.apple.com/documentation/uikit/uiview/1622623-systemlayoutsizefitting) method of an `UICollectionViewCell` and use it as you used to use the `systemLayoutSizeFitting`.

Code example:

import UIKit
```
class FlickPhotoCell: UICollectionViewCell {
    
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
    
    // Only this is called on iOS 12 and lower
    override func systemLayoutSizeFitting(_ targetSize: CGSize) -> CGSize {
        return CGSize(width: 50, height: 200)
    }
    
    // Only this is called on iOS 13 beta
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        return CGSize(width: 50, height: 200)
    }
}
```

# `systemLayoutSizeFitting` issue in iOS 13 beta
This project illustrates an difference in the way the `systemLayoutSizeFitting` of a `UICollectionViewCell` is being called when running the same code on iOS 12.1 and iOS 13.0 beta (Xcode version Version 11.0 beta 2 (11M337n)). This leads to the inability to implement a "self-sizing: cells inside a `UICollectionView` when running on iOS 13.
Also made a [thread](https://stackoverflow.com/questions/57184502/systemlayoutsizefittingsize-not-called-on-ios-13) in Stackoverflow regarding this issue.

The `systemLayoutSizeFitting` is used to implement the so called "self-sizing" cells inside `UICollectionView`:

## iOS 12.1 (the size of the cell is taken from[ systemLayoutSizeFittingSize:](https://developer.apple.com/documentation/uikit/uicollectionviewdelegateflowlayout/1617708-collectionview?language=objc))
<img src="screenshots/iOS 12.1.png">

## iOS 13 beta (the size of the cell is taken from [collectionView:layout:sizeForItemAtIndexPath:](https://developer.apple.com/documentation/uikit/uicollectionviewdelegateflowlayout/1617708-collectionview?language=objc))
<img src="screenshots/iOS 13.0.png">


