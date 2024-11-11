//
//  JobRequestRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/1/23.
//

import SwiftUI
import Kingfisher

struct JobRequestRowView: View {
    let user: User
    let trip: Trip
    
    var body: some View {
        let addJobButtonTitle = "Add Job"
        let deleteJobButtonTitle = "Reject Job"
        
        let maxWidth = UIScreen.main.bounds.width / 2.5
        //        let maxHeight = UIScreen.main.bounds.height / 3
        
        VStack{
            HStack {
                //MARK: Abbreviation Circle
                CircularProfileImageView(user: user, size: .xxLarge)
            }
            .padding(.bottom)
            
            //MARK: User Name
            VStack {
                HStack {
                    Text(user.fullname)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.leading)
                    
                    Image(systemName: "star.fill")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.yellow)
                        .frame(width: 12, height: 12)
                    
                    //MARK: Rating
                    Text("4.7")
                        .font(.caption)
                    
                    Spacer()
                    
                    Text("$90/HR")
                        .font(.headline)

                }
                .padding(.top, 1)
                .padding(.bottom, 4)
                
                //MARK: Pickup Time
                HStack {
                    //Need to calculate the
                    Text(Date().dateDisplayFormat)
                    
                    Spacer()
                 
                    Text("6:00 AM")

                }
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
                .padding(.bottom, 4)
                .padding(.leading)
                
                //MARK: Trip Details
                HStack {
                    Text(trip.travelTimeToPassenger.description)
                    
                    Text("Min")
                    
                    Spacer()
                    
                    Text(trip.distanceToPassenger.distanceInMilesString())
                    
                    Text("mi")
                    
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                
                .padding(.bottom, 1)
                .padding(.leading)
                
                //MARK: From Location
                HStack{
                    Text("From:")
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    Text(trip.pickupLocationName)
                    
                }
                .font(.subheadline)
                .padding(.leading)
                
                //MARK: To Location
                HStack{
                    Text("To:")
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Text(trip.dropoffLocationName)

                }
                .font(.subheadline)
                .padding(.leading)
                .padding(.top, 1)
                
                //MARK: Estimated Revenue
                HStack {
                    Text("Est Revenue: ")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Text(trip.tripCost.toCurrency())
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
                }
                .padding(.leading)
                .padding(.top)
                .padding(.bottom)
                
                //MARK: Add Job Button
                HStack {
                    Button {
                        //
                    } label: {
                        Text(addJobButtonTitle)
                            .frame(width: maxWidth, height: 25)
                            .fontWeight(.semibold)
                    }
                    .buttonStyle(.borderedProminent)
                    
                    //MARK: Remove Job Button
                    Button {
                        //                        friendViewModel.deleteFriend(friend, userFullName: friend.userFullName, profileImageUrl: friend.profileImageUrl!, acceptorUid: friend.uid)
                        //                        deleteFriendButtonTitle = "Rejected"
                    } label: {
                        Text(deleteJobButtonTitle)
                            .foregroundColor(.primary)
                            .frame(width: maxWidth, height: 25)
                            .fontWeight(.semibold)
                        
                    }
                    .buttonStyle(.bordered)
                    
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            
            Divider()
        }
        .padding(.horizontal)
    }
}

struct JobRequestRowView_Previews: PreviewProvider {
    static var previews: some View {
        JobRequestRowView(user: dev2.mockUser, trip: dev2.mockTrip)
    }
}
