//
//  IllnessListViewModelTests.swift
//  Hospital FinderTests
//
//  Created by Devi Pd Ghimire on 18/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//

import XCTest
import Quick
import Nimble
import Cuckoo

@testable import Hospital_Finder

class IllnessListViewModelTests: QuickSpec {

    override func spec() {
        var testViewModel: IllnessListViewModel!
        var mockWebService: MockIllnessListHandling!
        let mockstubIllnessList = MockData().stubIllnessList()
        var mockIllnesses: [IllnessViewModel] = []

        describe("IllnessListViewModel test") {
            beforeEach {

                mockIllnesses = mockstubIllnessList!.illnesses!.compactMap({ model -> IllnessViewModel in
                    return IllnessViewModel(model)
                })

                mockWebService = MockIllnessListHandling()

                stub(mockWebService) { stub in
                    when(stub.getIllnesses(anyClosure())).then { (completion) in
                        completion(mockstubIllnessList, nil)
                    }
                }

                testViewModel = IllnessListViewModel(withIllnessListHandling: mockWebService)
            }

            context("when get IllnessViewModel server request succeed ", {
                beforeEach {
                    //stub is cuckoo part
                    stub(mockWebService) { stub in
                        when(stub.getIllnesses(anyClosure())).then { (completion) in
                            completion(mockstubIllnessList, nil)
                        }
                    }
                    testViewModel.getIlleness { (status, error) in
                        expect(status).to(beTrue())
                        expect(error).to(beNil())
                    }

                }
                
                
                it("it completed successfully", closure: {
                    expect(testViewModel.illnesses).to(equal(mockIllnesses))
                    verify(mockWebService).getIllnesses(any())
                })

                it("set proper number of row") {
                    expect(testViewModel.numbersOfIllness).to(equal(10))
                }
                it("return proper row information") {
                    expect(testViewModel.illness(forIndex: 2)).to(equal(mockIllnesses[2]))
                }
            })

            context("when get IllnessViewModel server request failed with error", {

                beforeEach {
                    stub(mockWebService) { stub in
                        when(stub.getIllnesses(anyClosure())).then { (completion) in
                            completion(nil, mockError)
                        }
                    }
                    testViewModel.getIlleness { (status, error) in
                        expect(status).to(beFalse())
                        let errorResponse = error as! MockError
                        expect(errorResponse).to(equal(mockError))
                    }

                }
                it("it completed empty list", closure: {
                    expect(testViewModel.illnesses).to(equal([]))
                    verify(mockWebService).getIllnesses(any())
                })

                it("set proper of row to be 0") {
                    expect(testViewModel.numbersOfIllness).to(equal(0))
                }
            })
        }
    }
}
