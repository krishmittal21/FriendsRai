//
//  EmergencyButtonView.swift
//  FriendsRai
//
//  Created by Krish Mittal on 01/03/24.
//

import SwiftUI

struct EmergencyButtonView: View {
    @StateObject var viewModel = EmergencyButtonViewModel()
    @State private var selectedMessage: EmergencyMessage?
    @State private var isTapped: Bool = false
    @State private var showMenu: Bool = false
    let emergencyMessages = emergencyMessagesValues
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var isIpad: Bool {verticalSizeClass == .regular && horizontalSizeClass == .regular}
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.backgroundColor.ignoresSafeArea()
                if isIpad {
                    ipadButtonView
                } else {
                    buttonView
                }
            }
            
        }
    }
    
    @ViewBuilder
    var ipadButtonView: some View {
        VStack{
            Spacer()
            VStack {
                Text("Need Help ?")
                    .font(.system(size: 40, weight: .bold))
                    .padding(.bottom,10)
                Text("Message all your Friends at just one tap !")
                    .multilineTextAlignment(.center)
            }
            .foregroundStyle(Color.neutralDarkColor)
            .padding(.bottom,40)
            
            ZStack{
                Circle()
                    .frame(width: 700)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.orange, .red]), startPoint: .top, endPoint: .bottom))

                Text("SOS")
                    .font(.system(size: 120, weight: .bold))
                    .foregroundStyle(.white)
            }
            .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
            .scaleEffect(isTapped ? 1.2 : 1.0)
            .onTapGesture {
                withAnimation(.bouncy) {
                    viewModel.sendMessage()
                    isTapped.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        isTapped.toggle()
                    }
                }
            }
            
            Spacer()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(emergencyMessages, id: \.self) { message in
                        FRMessageCard(message: message, isSelected: selectedMessage == message){
                            if selectedMessage == message {
                                selectedMessage = nil
                            } else {
                                selectedMessage = message
                            }
                            viewModel.message = message.text
                        }
                    }
                }
                .foregroundStyle(Color.neutralDarkColor)
                .padding(20)
            }
            
            Spacer()
        }
        .preferredColorScheme(.light)
    }
    
    @ViewBuilder
    var buttonView: some View {
        VStack{
            Spacer()
            VStack {
                Text("Need Help ?")
                    .font(.system(size: 40, weight: .bold))
                    .padding(.bottom,10)
                Text("Message all your Friends at just one tap !")
                    .multilineTextAlignment(.center)
            }
            .foregroundStyle(Color.neutralDarkColor)
            .padding(.bottom,40)
            
            ZStack{
                Circle()
                    .frame(width: 300)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.orange, .red]), startPoint: .top, endPoint: .bottom))

                Text("SOS")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundStyle(.white)
            }
            .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
            .scaleEffect(isTapped ? 1.2 : 1.0)
            .onTapGesture {
                withAnimation(.bouncy) {
                    viewModel.sendMessage()
                    isTapped.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        isTapped.toggle()
                    }
                }
            }
            
            Spacer()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(emergencyMessages, id: \.self) { message in
                        FRMessageCard(message: message, isSelected: selectedMessage == message){
                            if selectedMessage == message {
                                selectedMessage = nil
                            } else {
                                selectedMessage = message
                            }
                            viewModel.message = message.text
                        }
                    }
                }
                .foregroundStyle(Color.neutralDarkColor)
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
