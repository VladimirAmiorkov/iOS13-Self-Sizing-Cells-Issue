# `systemLayoutSizeFitting` issue in iOS 13 beta
This project illustrates an difference in the way the `systemLayoutSizeFitting` of a `UICollectionViewCell` is being called when running the same code on iOS 12.1 and iOS 13.0 beta (Xcode version Version 11.0 beta 2 (11M337n)). This leads to the inability to implement a "self-sizing: cells inside a `UICollectionView` when running on iOS 13.
Also made a [thread](https://stackoverflow.com/questions/57184502/systemlayoutsizefittingsize-not-called-on-ios-13) in Stackoverflow regarding this issue.

The `systemLayoutSizeFitting` is used to implement the so called "self-sizing" cells inside `UICollectionView`:

## iOS 12.1 (the size of the cell is taken from[ systemLayoutSizeFittingSize:](https://developer.apple.com/documentation/uikit/uicollectionviewdelegateflowlayout/1617708-collectionview?language=objc))
<img src="screenshots/iOS 12.1.png">

## iOS 12.1 (the size of the cell is taken from [collectionView:layout:sizeForItemAtIndexPath:](https://developer.apple.com/documentation/uikit/uicollectionviewdelegateflowlayout/1617708-collectionview?language=objc))
<img src="screenshots/iOS 13.0.png">


