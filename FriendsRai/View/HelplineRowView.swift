//
//  HelplineRowView.swift
//  FriendsRai
//
//  Created by Krish Mittal on 09/03/24.
//

import SwiftUI

struct HelplineRowView: View {
    let name: String
    let number: String
    
    var body: some View {
        HStack {
            
            Text(name)
                .font(.headline)
            
            Spacer()
            
            Text(number)
                .foregroundColor(.blue)
                .onTapGesture {
                    if let url = URL(string: "tel://\(number)") {
                        UIApplication.shared.open(url)
                    }
                }
        }
        .padding()
    }
}

#Preview {
    HelplineRowView(name: "Police", number: "100")
}
