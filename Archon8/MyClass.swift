//
//  MyClass.swift
//  Archon8
//
//  Created by Garudagames on 6/3/16.
//  Copyright © 2016 smsfinance. All rights reserved.
//

import Foundation
@objc
public class MyClass: NSObject {
    
    var message: String
    var object: OurClass = OurClass()
    
    public init(_ newMessage: String) {
        self.message = newMessage
    }
    
    public func printMessage() {
        object.printMessage(self.message)
    }
}