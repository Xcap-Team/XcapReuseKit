//
//  UICollectionView+Ext.swift
//  
//
//  Created by scchn on 2022/10/5.
//

#if !os(macOS)

import UIKit

extension UICollectionView {
    
    // MARK: - register
    
    public func register<T: UICollectionViewCell & Reusable>(cellType: T.Type) {
        register(cellType, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
    
    public func register<T: UICollectionViewCell & NibReusable>(cellType: T.Type) {
        register(cellType.nib, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
    
    public func register<T: UICollectionReusableView & Reusable>(supplementaryViewType: T.Type, kind: String) {
        register(supplementaryViewType,
                 forSupplementaryViewOfKind: kind,
                 withReuseIdentifier: supplementaryViewType.reuseIdentifier)
    }
    
    public func register<T: UICollectionReusableView & NibReusable>(supplementaryViewType: T.Type, kind: String) {
        register(supplementaryViewType.nib,
                 forSupplementaryViewOfKind: kind,
                 withReuseIdentifier: supplementaryViewType.reuseIdentifier)
    }
    
    // MARK: - Dequeue
    
    public func dequeueReusableCell<T: UICollectionViewCell & Reusable>(ofType type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: type.reuseIdentifier, for: indexPath) as? T else {
            fatalErrorCreatingReusable(type)
        }
        return cell
    }
    
    public func dequeueReusableSupplementaryView<T: UICollectionReusableView & Reusable>(ofType type: T.Type, kind: String, for indexPath: IndexPath) -> T {
        guard let view = dequeueReusableSupplementaryView(ofKind: kind,
                                                          withReuseIdentifier: type.reuseIdentifier,
                                                          for: indexPath) as? T
        else {
            fatalErrorCreatingReusable(type)
        }
        return view
    }
    
}

#endif
