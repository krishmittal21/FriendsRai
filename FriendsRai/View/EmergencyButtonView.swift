//
//  EmergencyButtonView.swift
//  FriendsRai
//
//  Created by Krish Mittal on 01/03/24.
//

import SwiftUI

struct EmergencyButtonView: View {
    
    @StateObject var viewModel = EmergencyButtonViewModel()
    let emergencyMessages = emergencyMessagesValues
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.backgroundColor.ignoresSafeArea()
                buttonView
            }
        }
    }
    
    @ViewBuilder
    var buttonView: some View {
        VStack{
            Spacer()
            VStack {
                Text("Need Help ?")
                    .font(.system(size: 40, weight: .bold))
                    .padding(.bottom,10)
                Text("Message and send Location to all your Emergency Contacts")
                    .multilineTextAlignment(.center)
            }
            .foregroundStyle(Color.blackColor)
            .padding(.bottom,40)
            
            ZStack{
                Circle()
                    .frame(width: 300)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.orange, .red]), startPoint: .top, endPoint: .bottom))
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
                Text("SOS")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundStyle(.white)
            }
            .onTapGesture {
                viewModel.sendMessage()
            }
            
            Spacer()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(emergencyMessages, id: \.self) { message in
                        FRMessageCard(message: message){
                            viewModel.message = message.text
                        }
                    }
                }
                .foregroundStyle(Color.blackColor)
                .padding(20)
            }
            
            Spacer()
        }
        .preferredColorScheme(.light)
    }
}

#Preview {
    EmergencyButtonView()
}
