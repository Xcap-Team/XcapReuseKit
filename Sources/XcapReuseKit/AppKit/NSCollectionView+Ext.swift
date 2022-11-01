//
//  NSCollectionView+Ext.swift
//  
//
//  Created by scchn on 2022/10/5.
//

#if os(macOS)

import AppKit

extension NSCollectionView {
    
    public func register<T: NSCollectionViewItem & Reusable>(itemType: T.Type) {
        register(itemType.self, forItemWithIdentifier: itemType.reuseIdentifier)
    }
    
    public func register<T: NSCollectionViewItem & NibReusable>(itemType: T.Type) {
        register(itemType.nib, forItemWithIdentifier: itemType.reuseIdentifier)
    }
    
    public func register<T: NSView & Reusable>(supplementaryViewType: T.Type, kind: SupplementaryElementKind) {
        register(supplementaryViewType,
                 forSupplementaryViewOfKind: kind,
                 withIdentifier: supplementaryViewType.reuseIdentifier)
    }
    
    public func register<T: NSView & NibReusable>(supplementaryViewType: T.Type, kind: SupplementaryElementKind) {
        register(supplementaryViewType.nib,
                 forSupplementaryViewOfKind: kind,
                 withIdentifier: supplementaryViewType.reuseIdentifier)
    }
    
    public func makeItem<T: NSCollectionViewItem & Reusable>(ofType type: T.Type, for indexPath: IndexPath) -> T {
        guard let item = makeItem(withIdentifier: type.reuseIdentifier, for: indexPath) as? T else {
            fatalErrorCreatingReusable(type)
        }
        return item
    }
    
    public func makeSupplementaryView<T: NSView & Reusable>(ofType type: T.Type, kind: SupplementaryElementKind, for indexPath: IndexPath) -> T {
        guard let view = makeSupplementaryView(ofKind: kind, withIdentifier: type.reuseIdentifier, for: indexPath) as? T else {
            fatalErrorCreatingReusable(type)
        }
        return view
    }
    
}

#endif
