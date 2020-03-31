//
//  Utilities.swift
//  Moobaxas
//
//  Created by Peter Forward on 3/29/20.
//  Copyright © 2020 Peter Forward. All rights reserved.
//

import Foundation

/**
 Returns blank string if unable to obtain the Version String
- Returns: "Version: \(VersionString)"
 */
public func appVersion() -> String {
    if let VersionString = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
        return ("Version: \(VersionString)")
    }
    return ""
}

/**
 Returns blank string if unable to obtain the Bundle Name
 - Returns: App Display Name
 */
public func appDisplayName() -> String {
    
    if let BundleName = Bundle.main.infoDictionary?["CFBundleName"] as?  String {
        return BundleName
    } else if let BundleDisplayName = Bundle.main.infoDictionary?["CFBundleDisplayName"] as?  String {
        return BundleDisplayName
    }
    return ""
}
