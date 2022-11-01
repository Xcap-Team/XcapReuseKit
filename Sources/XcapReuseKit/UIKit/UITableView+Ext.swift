//
//  UITableViewCell+Ext.swift
//  
//
//  Created by scchn on 2022/10/5.
//

#if !os(macOS)

import UIKit

extension UITableView {
    
    // MARK: - register
    
    public func register<T: UITableViewCell & Reusable>(cellType: T.Type) {
        register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
    public func register<T: UITableViewCell & NibReusable>(cellType: T.Type) {
        register(cellType.nib, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
    public func register<T: UITableViewHeaderFooterView & Reusable>(headerFooterViewType: T.Type) {
        register(headerFooterViewType,
                 forHeaderFooterViewReuseIdentifier: headerFooterViewType.reuseIdentifier)
    }
    
    public func register<T: UITableViewHeaderFooterView & NibReusable>(headerFooterViewType: T.Type) {
        register(headerFooterViewType.nib,
                 forHeaderFooterViewReuseIdentifier: headerFooterViewType.reuseIdentifier)
    }
    
    // MARK: - Dequeue
    
    public func dequeueReusableCell<T: UITableViewCell & Reusable>(ofType type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: type.reuseIdentifier, for: indexPath) as? T else {
            fatalErrorCreatingReusable(type)
        }
        return cell
    }
    
    public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView & Reusable>(ofType type: T.Type) -> T {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: type.reuseIdentifier) as? T else {
            fatalErrorCreatingReusable(type)
        }
        return view
    }
    
}

#endif
