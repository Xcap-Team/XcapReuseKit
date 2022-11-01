//
//  NibProvider.swift
//  
//
//  Created by scchn on 2022/10/8.
//

#if os(macOS)
import AppKit
#else
import UIKit
#endif

#if os(macOS)
public typealias PlatformNib = NSNib
#else
public typealias PlatformNib = UINib
#endif

public protocol NibProvider: AnyObject {
    static var nib: PlatformNib { get }
}

extension NibProvider {
    
    public static var nib: PlatformNib {
        let name = String(describing: self)
        let bundle = Bundle(for: self)
        
        #if os(macOS)
        
        guard let nib = NSNib(nibNamed: name, bundle: bundle) else {
            fatalError("Failed to load nib.")
        }
        return nib
        
        #else
        
        return UINib(nibName: name, bundle: bundle)
        
        #endif
    }
    
}
