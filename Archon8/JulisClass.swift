//
//  JulisClass.swift
//  Archon8
//
//  Created by Julis on 06/06/16.
//  Copyright © 2016 smsfinance. All rights reserved.
//

import Foundation
@objc
public class JulisClass : NSObject{
    var message: String
    var object: OurClass = OurClass()
    
    public init(_ newMessage: String) {
        self.message = newMessage
    }
    
    public func printMessage(withMessage message: String) {
        object.printMessage("\(self.message) with \(message)")
    }
}