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
       
        var mocHospitalListHandller: MockHospitalListHandling!
        
        //read data from json file 
        let mockStubHospitalsListModel = MockData().stubHospitalsList()
       
        //View model from moc models above
        var mockHospitalListVM: [HospitalViewModel] = []

        describe("HospitalListViewModel test") {
            beforeEach {

                // sidhai data padheko  json bata jun chai expected value jasto ho
                // init, populate view model form mock mockStubHospitalsListModel , obtained from json
                mockHospitalListVM = mockStubHospitalsListModel!.hospitals!.compactMap({ model -> HospitalViewModel in
                    return HospitalViewModel(model)
                })
                
                //1
                // aaba service lai mock garera moc service bata data tanne ani aako result lai assert garne
                //method call mocking for handler
                mocHospitalListHandller = MockHospitalListHandling()
                
                stub(mocHospitalListHandller) { stub in
                    when(stub.getHospitals(anyClosure())).then { (completion) in
                        
                        // service call sake pachhi mathi ko sidhai mock data mo file bata aako data as result pathaune
                        completion(mockStubHospitalsListModel, nil)
                    }
                }

                // mathi 1 ma vako implementation yaha view model ma use hunchha
                testViewModel = HospitalListViewModel(withHospitalistHandling: mocHospitalListHandller)
            }

            context("when get HospitalViewModel server request succeed ", {
               
                beforeEach {
//                    stub(mocHospitalListHandller) { stub in
//                        when(stub.getHospitals(anyClosure())).then { (completion) in
//                            completion(mockStubHospitalsListModel, nil)
//                        }
//                    }
                    
                    testViewModel.getHospitals { (status, error) in
                        expect(status).to(beTrue())
                        expect(error).to(beNil())
                    }

                }
                
                it("it completed successfully", closure: {
                    for element in testViewModel.hospitals.enumerated() {
                        let (index, item) =  element
                        
                        let mockHospitalItem = mockHospitalListVM[index]
                        
                        expect(item.id).to(equal(mockHospitalItem.id))
                        expect(item.name).to(equal(mockHospitalItem.name))
                        expect(item.location?.lat).to(equal(mockHospitalItem.location?.lat))
                        expect(item.location?.long).to(equal(mockHospitalItem.location?.long))
                    }
                    verify(mocHospitalListHandller).getHospitals(any())
                })

                it("set proper number of row") {
                    expect(testViewModel.numbersOfHospitals).to(equal(10))
                }
                it("return proper row information") {
                    let mockHospitalItem = mockHospitalListVM[2]
                    let item = testViewModel.hospitals[2]
                    expect(item.id).to(equal(mockHospitalItem.id))
                    expect(item.name).to(equal(mockHospitalItem.name))
                    expect(item.location?.lat).to(equal(mockHospitalItem.location?.lat))
                    expect(item.location?.long).to(equal(mockHospitalItem.location?.long))
                }
            })

            context("when get HospitalViewModel server request failed with error", {

                beforeEach {
                    stub(mocHospitalListHandller) { stub in
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
                    verify(mocHospitalListHandller).getHospitals(any())
                })

                it("set proper of row to be 0") {
                    expect(testViewModel.numbersOfHospitals).to(equal(0))
                }
            })
        }
    }
}
