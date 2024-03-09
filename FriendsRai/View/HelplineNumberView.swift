//
//  HelplineNumberView.swift
//  FriendsRai
//
//  Created by Krish Mittal on 01/03/24.
//

import SwiftUI

struct HelplineNumberView: View {
    var body: some View {
        NavigationView{
            VStack{
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(indiaHelplineNumbers, id: \.name) { helpline in
                            HelplineRowView(name: helpline.name, number: helpline.number)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Resources")
        }
    }
}

#Preview {
    HelplineNumberView()
}
