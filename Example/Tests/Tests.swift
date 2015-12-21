// https://github.com/Quick/Quick

import Quick
import Nimble
import IOLazyList

class IOLazyListSpec: QuickSpec {
    
    override func spec() {
        
        class FakeElement : LazyListElementProtocol {}
        
        class FakeDataSource : LazyListDataSourceProtocol {
            var resetCalled = false
            var nextPageCalled = false
            var fakeElement = FakeElement()
            func resetCompletion(completionBlock:CompletionBlock) {
                self.resetCalled = true
                completionBlock()
            }
            func nextPage(filter:LazyListFilterProtocol?, dataBlock:DataBlock, errorBlock:ErrorBlock) {
                self.nextPageCalled = true
                dataBlock(data:[self.fakeElement])
            }
        }
        
        describe("initialization") {
            
            it ("returns instance") {
                let sut = LazyList(dataSource: FakeDataSource())
                expect(sut) != nil
            }
            
            it ("assigns datasource") {
                let mockDataSource = FakeDataSource()
                let sut = LazyList(dataSource: mockDataSource)
                expect(sut.dataSource === mockDataSource as LazyListDataSourceProtocol).to(beTrue())
            }

            it ("initializes empty elements list") {
                let mockDataSource = FakeDataSource()
                let sut = LazyList(dataSource: mockDataSource)
                expect(sut.elements.count) == 0
            }

        }

        describe("reset") {
            
            it ("calls datasource reset") {
                let mockDataSource = FakeDataSource()
                let sut = LazyList(dataSource: mockDataSource)
                sut.reset()
                expect(mockDataSource.resetCalled).toEventually(beTrue(), timeout: 10)
            }
            
            it ("calls datasource nextPage") {
                let mockDataSource = FakeDataSource()
                let sut = LazyList(dataSource: mockDataSource)
                sut.reset()
                expect(mockDataSource.nextPageCalled).toEventually(beTrue(), timeout: 10)
            }

        }

        describe("more") {
            
            it ("calls datasource nextPage") {
                let mockDataSource = FakeDataSource()
                let sut = LazyList(dataSource: mockDataSource)
                sut.more()
                expect(mockDataSource.nextPageCalled).toEventually(beTrue(), timeout: 10)
            }
            
        }

    }
}
