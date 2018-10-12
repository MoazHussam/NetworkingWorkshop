//
//  UICollectionView+ResusableCell.swift
//  AqarMap
//
//  Created by Moaz Ahmed on 7/17/17.
//  Copyright © 2017 AqarMap. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func registerCellNib<T: UICollectionViewCell>(_: T.Type) where T: NibLoadableView {
        
        let Nib = UINib(nibName: T.NibName, bundle: nil)
        register(Nib, forCellWithReuseIdentifier: T.reuseIdentifier)
        
    }
    
    func registerCellClass<T: UICollectionViewCell>(_: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerHeaderClass<T: UICollectionViewCell>(_: T.Type) {
        register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerHeaderNib<T: UICollectionViewCell>(_: T.Type) where T: NibLoadableView {
        
        let Nib = UINib(nibName: T.NibName, bundle: nil)
        register(Nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier)
        
    }
    
    func registerFooterClass<T: UICollectionViewCell>(_: T.Type) {
        register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerFooterNib<T: UICollectionViewCell>(_: T.Type) where T: NibLoadableView {
        
        let Nib = UINib(nibName: T.NibName, bundle: nil)
        register(Nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.reuseIdentifier)
        
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func dequeueReusableHeader<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let header = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue header with identifier: \(T.reuseIdentifier)")
        }
        return header
    }
    
    func dequeueReusableFooter<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let footer = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue footer with identifier: \(T.reuseIdentifier)")
        }
        return footer
    }
    
}
