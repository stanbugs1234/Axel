//
//  DeveloperPreview.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/15/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let mockTrip = Trip(
        dispatcherUid: NSUUID().uuidString,
        driverUid: NSUUID().uuidString,
        dispatcherName: "Stan Bugusky",
        driverName: "Carl P",
        dispatcherLocation: .init(latitude: 37.123, longitude: -122.1),
        driverLocation: .init(latitude: 37.123, longitude: -122.1),
        pickupLocationName: "Woods Materials",
        dropoffLocationName: "Starbucks",
        pickupLocationAddress: "123 Main Street",
        pickupLocation: .init(latitude: 37.1, longitude: -122.1),
        dropoffLocation: .init(latitude: 37.2, longitude: -122.1),
        tripCost: 50.0,
        distanceToPassenger: 1000.0,
        travelTimeToPassenger: 24,
        state: .rejected
    )
    
    let mockUser = User(fullname: "Stan Bugusky",
                        email: "Stanbugs1234@icloud.com",
//                        uid: NSUUID().uuidString,
                        coordinates: GeoPoint(latitude: 29.9511, longitude: 90.0812),
                        accountType: .driver,
                        homeLocation: nil,
                        workLocation: nil,
                        profileImageUrl: ""
    )
    
    
    
    let mockTruck = Truck(
//        truckId: NSUUID().uuidString,
        truckName: "OH-01",
        companyId: "Otwell Services",
        truckType: "Triaxle",
        truckMadeYear: Date(),
        truckMake: "Mack",
        truckModel: "Z723",
        truckSerialNumber: "NDK112LKJ23",
        truckPurchaseDate: Date(),
        truckInsurancePolicyNumber: "1002134",
        isTruckInsurancePolicyCurrent: true,
        truckInsuranceDateExpiring: Date()
        
    )
    
    let mockCustomer = Customer(
        customerAddress: "1255 Peters Road, Harvey, LA",
        customerFullName: "Otwell Services",
        timestamp: Timestamp(date: Date()),
        uid: NSUUID().uuidString,
        customerState: customerState.activeCustomer
    )
    
    
    let mockPhoto = Photo(id: "dn36JHwwu5YerAdctVuW9Insu372",
                          imageURLString:" https://firebasestorage.googleapis.com:443/v0/b/thetruckrapp.appspot.com/o/dn36JHwwu5YerAdctVuW9Insu372811C34C1-B3EA-479D-B527-40A642891A13.jpeg?alt=media&token=f9b0571c-397f-4d7c-9ed5-1b1ec978ce22",
                          description: "Test",
                          user: "stanbugs1234@icloud.com",
                          postedOn: Date()
    )
    

    
    let mockVendor = Vendor(
                            vendorFullName: "PMC",
                            vendorCompanyId: "PMC-01",
                            vendorAddressName: "2611 Enginerers Rd, Belle Chasse, LA 700037",
                            vendorState: vendorState.activeVendor,
                            uid: "Sldkfsldkfn",
                            timestamp: Timestamp(date: Date()), vendorProfileImageUrl: "",
                            likes: 0
    )
    
    
    let mockJob = Job(jobName: "Mid City Group B",
                      customerName: "HardRock Construction",
                      jobAddressName: "500 S. Solomon, New Orleans, LA",
                      jobPayType: "Hourly",
                      jobPayRate: 85.00,
                      uid: "Stan",
                      timestamp: Timestamp(date: Date()),
                      jobState: jobState.activeJob

    )
    
    
    let mockProduct = Product(
        productFullName: "610 Crushed Concrete",
        companyName: "PMC",
        productCategory: "Crushed Concrete"
    )
    
    
    
    let mockPost = Post(
        caption: "I love making Dev Items",
                        timestamp: Timestamp(date: Date()),
                        uid: "Mock POst Uid String",
                        likes: 100,
                        user: DeveloperPreview.shared.mockUser
    )
    
    let mockOrder = Order(
//        orderDate: Date().dateDisplayFormat,
        customerName: "Fleming Construction",
        jobName: "Bayou St. John",
        numberOfTrucks: 3,
        vendorName: "PMC",
        orderComments: "Go to First gate and ask for Michael Jordan",
        uid: "sldkslnvoiskjl123l",
        timestamp: Timestamp(date: Date())
    )
    
    
    
    let mockContact = Contact(
//        contactId: NSUUID().uuidString,
        contactFullName: "Stan Bugusky",
        contactPhoneNumber: "504-508-0727",
        contactEmail: "Stanbugs1234@icloud.com",
        contactCompanyName: "BBG Holdings LLC",
        uid: "stanbuguskyUID",
        timestamp: Timestamp(date: Date())
    )
    
}
