//
//  IOLazyListProtocol.swift
//  IOLazyList
//
//  Created by Ivan Oliver Martínez on 20/12/15.
//  Copyright © 2015 Ivan Oliver. All rights reserved.
//

import Foundation

public protocol LazyListElementProtocol {
}

public protocol LazyListFilterProtocol {
    var start : Int { get }
    var count : Int { get }
    var filter : String { get }
}

public protocol LazyListDataSourceProtocol : class {
    func resetCompletion(completionBlock:CompletionBlock)
    func nextPage(filter:LazyListFilterProtocol?, dataBlock:DataBlock, errorBlock:ErrorBlock)
}

public protocol LazyListProtocol : class {

    var dataSource : LazyListDataSourceProtocol { get set }
    var elements : [LazyListElementProtocol] { get set }
    var filter : LazyListFilterProtocol? { get set }
    var delegate : LazyListDelegate? { get set }
    
    init(dataSource:LazyListDataSourceProtocol)
    
    func reset()
    func more()
    
    func numberOfElements() -> Int
    func elementAtRow(row: Int) -> LazyListElementProtocol?
}

public protocol LazyListDelegate {
    func lazyListWillRefreshContents(lazyList:LazyListProtocol)
    func lazyListDidRefreshContents(lazyList:LazyListProtocol)
    func lazyListLoadError(lazyList:LazyListProtocol, error:NSError)
}
