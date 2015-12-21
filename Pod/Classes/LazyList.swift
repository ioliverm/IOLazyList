//
//  IOLazyList.swift
//  IOLazyList
//
//  Created by Ivan Oliver Martínez on 09/12/15.
//  Copyright © 2015 Ivan Oliver. All rights reserved.
//

import UIKit

public class LazyList : NSObject, LazyListProtocol {
    
    // MARK: - Attributes
    
    public var dataSource : LazyListDataSourceProtocol
    public var elements : [LazyListElementProtocol]
    public var delegate : LazyListDelegate?
    public var filter : LazyListFilterProtocol?
    
    // MARK: - Initialization
    
    public required init(dataSource:LazyListDataSourceProtocol) {
        self.dataSource = dataSource
        self.elements = [LazyListElementProtocol]()
    }
    
}
