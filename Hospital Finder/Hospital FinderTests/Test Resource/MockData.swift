//
//  MockData.swift
//  Hospital FinderTests
//
//  Created by Devi Pd Ghimire on 18/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//

import XCTest
@testable import Hospital_Finder

class MockData {

    func stubHospitalsList() -> HospitalListModel? {

        guard let data = self.readJson(forResource: "Hospitals") else {
            XCTAssert(false, "Can't get data from Hospitals.json")
            return nil
        }

        let decoder = JSONDecoder()
        if let result = try? decoder.decode(HospitalListModel.self, from: data) {
            return result
        } else {
            XCTAssert(false, "Unable to parse Hospitals json")
            return nil
        }
    }

    func stubIllnessList() -> IllnessListModel? {

        guard let data = self.readJson(forResource: "Illnesses") else {
            XCTAssert(false, "Can't get data from Illnesses.json")
            return nil
        }

        let decoder = JSONDecoder()
        if let result = try? decoder.decode(IllnessListModel.self, from: data) {
            return result
        } else {
            XCTAssert(false, "Unable to parse Illnesses results")
            return nil
        }
    }

    func readJson(forResource fileName: String ) -> Data? {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            XCTFail("Missing file: \(fileName).json")
            return nil
        }
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            XCTFail("unable to read json")
            return nil
        }
    }

}
