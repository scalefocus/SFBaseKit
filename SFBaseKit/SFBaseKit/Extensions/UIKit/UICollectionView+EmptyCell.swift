//
//  UICollectionView+EmptyCell.swift
//  BaseKit
//
//  Created by Martin Vasilev on 15.11.18.
//  Copyright © 2018 Upnetix. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    func emptyCell(for indexPath: IndexPath) -> UICollectionViewCell {
        register(UICollectionViewCell.self, forCellWithReuseIdentifier: "emptyCell")
        return dequeueReusableCell(withReuseIdentifier: "emptyCell", for: indexPath)
    }
    
}
