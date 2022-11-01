//
//  Reusable.swift
//  
//
//  Created by scchn on 2022/10/5.
//

import Foundation

#if os(macOS)
import AppKit
#endif

public typealias NibReusable = Reusable & NibProvider

#if os(macOS)
public typealias ReuseIdentifier = NSUserInterfaceItemIdentifier
#else
public typealias ReuseIdentifier = String
#endif

public protocol Reusable: AnyObject {
    static var reuseIdentifier: ReuseIdentifier { get }
}

extension Reusable {
    
    public static var reuseIdentifier: ReuseIdentifier {
        let name = String(describing: self)
        
        #if os(macOS)
        
        return .init(name)
        
        #else
        
        return name
        
        #endif
    }
    
}

func fatalErrorCreatingReusable<T: Reusable>(_ type: T.Type) -> Never {
    fatalError("Failed to create \(type) for reuse identifier \(type.reuseIdentifier).")
}
