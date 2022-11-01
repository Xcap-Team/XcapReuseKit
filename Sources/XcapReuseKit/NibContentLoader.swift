//
//  NibContentLoader.swift
//  
//
//  Created by scchn on 2022/10/5.
//

#if os(macOS)
import AppKit
#else
import UIKit
#endif

public protocol NibContentLoader: NibProvider {
    
}

#if os(macOS)

extension NibContentLoader where Self: NSView {
    
    private func installView(_ view: NSView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(view)
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    public func loadNibContent() {
        var topLevelObjects: NSArray?
        
        Self.nib.instantiate(withOwner: self, topLevelObjects: &topLevelObjects)
        
        topLevelObjects?
            .compactMap { $0 as? NSView }
            .forEach(installView(_:))
    }
    
}

#else

extension NibContentLoader where Self: UIView {
    
    private func installView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(view)
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    public func loadNibContent() {
        Self.nib
            .instantiate(withOwner: self, options: nil)
            .compactMap { $0 as? UIView }
            .forEach(installView(_:))
    }
    
}

#endif
