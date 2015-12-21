//
//  Utils.swift
//  IOLazyList
//
//  Created by Ivan Oliver Martínez on 20/12/15.
//  Copyright © 2015 Ivan Oliver. All rights reserved.
//

import Foundation

public typealias CompletionBlock = () -> Void
public typealias DataBlock = (data : [AnyObject]) -> Void
public typealias ErrorBlock = (error: NSError) -> Void

var GlobalMainQueue: dispatch_queue_t {
    return dispatch_get_main_queue()
}

var GlobalUserInteractiveQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_USER_INTERACTIVE.rawValue), 0)
}

var GlobalUserInitiatedQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_USER_INITIATED.rawValue), 0)
}

var GlobalUtilityQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_UTILITY.rawValue), 0)
}

var GlobalBackgroundQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_BACKGROUND.rawValue), 0)
}