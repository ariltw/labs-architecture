//
//  BuildConfig.swift
//  Gamy
//
//  Created by Ariel on 05/11/20.
//

import Foundation

enum BuildConfig : String {
    case BaseURL = "BaseURL"
    case AppleID = "APPLE_ID"
}

extension BuildConfig {
    static func getString(key: BuildConfig) -> String {
        return Bundle.main.object(forInfoDictionaryKey: key.rawValue) as! String
    }
    
    static func getBoolean(key: BuildConfig) -> Bool {
        let value = Bundle.main.object(forInfoDictionaryKey: key.rawValue) as! String
        return Bool(value) ?? false
    }
    
    static func getDictionary(key: BuildConfig) -> Dictionary<String, Any> {
        return Bundle.main.object(forInfoDictionaryKey: key.rawValue) as! Dictionary
    }
}
