//
//  HCDedignManager.swift
//  HCDesignKit
//
//  Created by Cheng on 2021/8/20.
//

import UIKit

public class HCDedignManager {
    
    public static let shared: HCDedignManager = HCDedignManager()
    
    public var plistName: String {
        didSet {
            self.setUpPlist()
        }
    }
    
    public private(set) var configParams: Dictionary<String, Any>?
    
    init() {
        
        self.plistName = "DesignConfig"
        self.setUpPlist()
    }
}

extension HCDedignManager {
    
    func setUpPlist() {
        
        let plistPath = Bundle.main.path(forResource: self.plistName, ofType: "plist") ?? ""
        
        if let dictionary = NSDictionary(contentsOfFile: plistPath) {
            self.configParams = dictionary as? Dictionary<String, Any>;
        }
    }
}
