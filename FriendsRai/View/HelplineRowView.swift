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
            
            Text(splitName())
                .font(.headline)
                .fixedSize(horizontal: false, vertical: true)
            
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
    
    func splitName() -> String {
        let words = name.components(separatedBy: " ")
        var formattedName = ""
        for i in stride(from: 0, to: words.count, by: 2) {
            let firstWord = words[i]
            var secondWord = ""
            if i + 1 < words.count {
                secondWord = words[i + 1]
            }
            formattedName += "\(firstWord) \(secondWord)"
            if i + 2 < words.count {
                formattedName += "\n"
            }
        }
        return formattedName
    }
}

#Preview {
    HelplineRowView(name: "Police", number: "100")
}
