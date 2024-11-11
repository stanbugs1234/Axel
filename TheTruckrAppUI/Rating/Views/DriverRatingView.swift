//
//  DriverRatingView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/2/23.
//

import SwiftUI
import Kingfisher

struct DriverRatingView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    let user: User
    @State private var viewModel = RatingSystem(rawValue: 0)
    @ObservedObject var uploadRatingViewModel = UploadRatingViewModel()
//    @State private var selectedStar = 0
    
    var label = ""
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        VStack {
            HStack {
                Text("How did \(user.fullname) do?")
                    .font(.title2)
            }
            .padding(.bottom)
            
            HStack {
                //MARK: Abbreviation Circle
                CircularProfileImageView(user: user, size: .large)
                
                 //MARK: User Name
                Text(user.fullname)
                    .font(.title2)
                    .padding(.leading)
            }
            .padding(.bottom, 4)
            
            //MARK: Star Rating
            HStack {
                ForEach(1..<maximumRating + 1, id: \.self) { number in
                    Button {
                        uploadRatingViewModel.rating = number
                    } label: {
                        image(for: number)
                            .resizable()
                            .foregroundStyle(number > uploadRatingViewModel.rating ? offColor : onColor)
                            .frame(width: 30, height: 30)
                            .padding(.horizontal, 10)
                    }
                }
            }
            .buttonStyle(.plain)
            .padding(.top, 18)
            
//            //MARK: Rating Title
//            HStack {
//                Text(viewModel!.title)
//                    .font(.title3)
//                    .fontWeight(.semibold)
//            }
//            .padding()
        
            //MARK: Submit Rating Button
            HStack {
                Button {
                    uploadRatingViewModel.uploadRating(driverUid: user.uid!, rating: uploadRatingViewModel.rating)
                } label: {
                    Text("Submit")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding(.top, 35)
        }
        .padding()
    }
        
    
    func image(for number: Int) -> Image {
        if number > uploadRatingViewModel.rating {
            offImage ?? onImage
        } else  {
            onImage
        }
    }
}

struct DriverRatingView_Previews: PreviewProvider {
    static var previews: some View {
        DriverRatingView(user: dev2.mockUser)
    }
}
