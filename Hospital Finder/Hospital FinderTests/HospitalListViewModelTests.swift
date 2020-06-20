//
//  HospitalListViewModelTests.swift
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

class HospitalListViewModelTests: QuickSpec {

    override func spec() {
        var testViewModel: HospitalListViewModel!
        var mockWebService: MockHospitalListHandling!
        let mockStubHospitalsList = MockData().stubHospitalsList()
        var mockHospitalList: [HospitalViewModel] = []

        describe("HospitalListViewModel test") {
            beforeEach {

                mockHospitalList = mockStubHospitalsList!.hospitals!.compactMap({ model -> HospitalViewModel in
                    return HospitalViewModel(model)
                })

                mockWebService = MockHospitalListHandling()
                stub(mockWebService) { stub in
                    when(stub.getHospitals(anyClosure())).then { (completion) in
                        completion(mockStubHospitalsList, nil)
                    }
                }

                testViewModel = HospitalListViewModel(withHospitalistHandling: mockWebService)
            }

            context("when get HospitalViewModel server request succeed ", {
                beforeEach {
                    stub(mockWebService) { stub in
                        when(stub.getHospitals(anyClosure())).then { (completion) in
                            completion(mockStubHospitalsList, nil)
                        }
                    }
                    testViewModel.getHospitals { (status, error) in
                        expect(status).to(beTrue())
                        expect(error).to(beNil())
                    }

                }
                it("it completed successfully", closure: {
                    for element in testViewModel.hospitals.enumerated() {
                        let (index, item) =  element
                        let mockHospitalItem = mockHospitalList[index]
                        expect(item.id).to(equal(mockHospitalItem.id))
                        expect(item.name).to(equal(mockHospitalItem.name))
                        expect(item.location?.lat).to(equal(mockHospitalItem.location?.lat))
                        expect(item.location?.long).to(equal(mockHospitalItem.location?.long))
                    }
                    verify(mockWebService).getHospitals(any())
                })

                it("set proper number of row") {
                    expect(testViewModel.numbersOfHospitals).to(equal(10))
                }
                it("return proper row information") {
                    let mockHospitalItem = mockHospitalList[2]
                    let item = testViewModel.hospitals[2]
                    expect(item.id).to(equal(mockHospitalItem.id))
                    expect(item.name).to(equal(mockHospitalItem.name))
                    expect(item.location?.lat).to(equal(mockHospitalItem.location?.lat))
                    expect(item.location?.long).to(equal(mockHospitalItem.location?.long))
                }
            })

            context("when get HospitalViewModel server request failed with error", {

                beforeEach {
                    stub(mockWebService) { stub in
                        when(stub.getHospitals(anyClosure())).then { (completion) in
                            completion(nil, mockError)
                        }
                    }
                    testViewModel.getHospitals { (status, error) in
                        expect(status).to(beFalse())
                        let errorResponse = error as! MockError
                        expect(errorResponse).to(equal(mockError))
                    }

                }
                it("it completed empty list", closure: {
                    expect(testViewModel.hospitals.count).to(equal(0))
                    verify(mockWebService).getHospitals(any())
                })

                it("set proper of row to be 0") {
                    expect(testViewModel.numbersOfHospitals).to(equal(0))
                }
            })
        }
    }
}
