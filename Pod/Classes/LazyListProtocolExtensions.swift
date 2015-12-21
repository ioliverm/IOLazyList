//
//  LazyListProtocolExtensions.swift
//  Pods
//
//  Created by Ivan Oliver Martínez on 21/12/15.
//
//

import Foundation

extension LazyListProtocol {
    
    // MARK: - LazyListProtocol protocol methods
    
    public func reset() {
        self.safeBlockDispatch { () -> Void in
            self.elements.removeAll()
            self.dataSource.resetCompletion({ () -> Void in
                self.more()
            })
        }
    }
    
    public func more() {
        self.safeBlockDispatch { () -> Void in
            if let d = self.delegate { d.lazyListWillRefreshContents(self) }
            self.dataSource.nextPage(self.filter, dataBlock: { (data) -> Void  in
                for element in data {
                    self.elements.append(element as! LazyListElementProtocol)
                }
                if let d = self.delegate { d.lazyListDidRefreshContents(self) }
                }, errorBlock: { (error) -> Void in
                    self.delegate!.lazyListLoadError(self, error: error)
            })
        }
    }
    
    public func numberOfElements() -> Int {
        return self.elements.count;
    }
    
    public func elementAtRow(row: Int) -> LazyListElementProtocol? {
        if row < self.elements.count {
            return self.elements[row]
        }
        return nil
    }
    
    func safeBlockDispatch(block: ()->Void) -> Void {
        dispatch_async(GlobalBackgroundQueue, block)
    }
    
}