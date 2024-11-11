//
//  JobListRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/9/23.
//

import SwiftUI

struct JobListRowView: View {
    let job: Job
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(job.jobName)
                        .font(.headline)
                        .fontWeight(.bold)
                    .foregroundColor(.themeGreen)
                    
                    Spacer()
                    
                    Text("Active")
                        .font(.footnote)
                }
                .padding(.bottom, 4)
                
                Text(job.customerName)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
            }
            
            //TODO: Determine if Chevron right is needed.  Removed to see what it looked like
//            Spacer()
//            
//                Image(systemName: "chevron.right")
//                    .resizable()
//                    .frame(width: 8, height: 8, alignment: .trailing)
//                    .foregroundColor(.secondary)
//                    .padding()
        }
        .foregroundColor(.themeGreen)
        .padding()
    }
}

struct JobListRowView_Previews: PreviewProvider {
    static var previews: some View {
        JobListRowView(job: dev2.mockJob)
    }
}
