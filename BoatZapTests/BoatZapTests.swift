//
//  BoatZapTests.swift
//  BoatZapTests
//
//  Created by Peter Aurigemma on 2/17/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import XCTest
@testable import BoatZap

class BoatZapTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//------ BoatItem Class Tests ------
func testBoatItemInitSucceeds() {
    let littleBoatItem = Boat.init( id: "1", data: ["name" : "Row Boat", "type" : "Power" , "make" : "Hinckley", "length": "8", "price" : "1199.99" ,"address" : "123 School Rd. Essex, CT","latitude": "42.234","longitude": "43.234", "photo" :"boatPics/CCSailboat.jpg"])
    XCTAssertNotNil(littleBoatItem)
    let bigBoatItem = Boat.init( id: "1", data: ["name" : "Island", "type" : "Power" , "make" : "SunSeeker", "length": "280", "price" : "6001199.99" ,"address" : "12 school St. New Haven, CT" , "latitude": "42.124","longitude": "41.234", "photo" :"boatPics/CCSailboat.jpg"])
    XCTAssertNotNil(bigBoatItem)
}
   
    func testBoatItemInitFails() {
            // Item with no make
        let noMakeItem = Boat.init(id: "1", data: ["name" : "Usain Boat", "type" : "Power" , "length": "40", "price" : "400000.99" ,"address" : "1123 High St. New Haven, CT" , "latitude": "42.124", "longitude": "41.234", "photo" :"boatPics/CCSailboat.jpg"])
            XCTAssertNil(noMakeItem)
        // Item with no photo
        let noPhotoItem = Boat.init(id: "1", data: ["name" : "Island", "type" : "Power" , "make" : "SunSeeker", "length": "280", "price" : "6001199.99" ,"address" : "12 school St. New Haven, CT" , "latitude": "42.124","longitude": "41.234"])
            XCTAssertNil(noPhotoItem)
    }
//    
//    func testBoatItemPriceDifference(){
//        let bigBoatItem = BoatItem.init(name: "Island", type: "Power" , make: "Sun Seeker", length: 230, currentPrice: 60000000.00)
//        bigBoatItem!.startingPrice = 61000000.00
//        var total: Double
//        total  = bigBoatItem!.returnPriceDifference(BoatItem: bigBoatItem!)
//        XCTAssertEqual(-1000000.00, total)
//    }
//    //------ BoatListing Class Tests -----
//    func testBoatListingAddItem() {
//        let oneBoatItem = BoatItem.init(name: "Row Boat1", type: "Power" , make: "Hinckley", length: 8, currentPrice: 1199.99)
//        let twoBoatItem = BoatItem.init(name: "Row Boat2", type: "Power" , make: "Hinckley", length: 8, currentPrice: 1199.99)
//        let boatList = BoatListings.init()
//        XCTAssertEqual(0, boatList.boats.count)
//        boatList.addBoat(item: oneBoatItem!)
//        XCTAssertEqual(1, boatList.boats.count)
//        boatList.addBoat(item: twoBoatItem!)
//        XCTAssertEqual(2, boatList.boats.count)
//        //XCTAsser
//    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
