//
//  LogUtils.swift
//  UEHtml
//
//  Created by dengwz on 2017/5/26.
//  Copyright © 2017年 QuerySky. All rights reserved.
//

import UIKit
import XCGLogger

class LogUtils: NSObject {
    
    open static var `default`: LogUtils = {
        struct Statics {
            static let instance: LogUtils = LogUtils()
        }
        
        return Statics.instance
    }()
    
    override init() {
        super.init()
        setup()
    }

    private func setup( ) {
        let cachePath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let logURL = cachePath.appendingPathComponent(Date.init().description + ".txt")
        
        let log = XCGLogger.default
        #if DEBUG
            log.setup(level: .debug, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true,
                      writeToFile: logURL, fileLevel: .debug)
        #else
            log.setup(level: .severe, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true,
                      writeToFile: logURL, fileLevel: .debug)
        #endif
    }
}

extension LogUtils{
    
    func debug(_ obj:Any) {
        let log = XCGLogger.default
        log.debug(obj)
    }
}


