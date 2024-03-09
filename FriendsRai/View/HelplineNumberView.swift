//
//  HelplineNumberView.swift
//  FriendsRai
//
//  Created by Krish Mittal on 01/03/24.
//

import SwiftUI

struct HelplineNumberView: View {
    
    @State private var countryIndex = 0
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section{
                        Picker(selection: $countryIndex, label : Text("Country").bold()){
                            ForEach(0 ..< Country.allCases.count){
                                Text(Country.allCases[$0].countryName).tag($0)
                            }
                        }
                    }
                }
                .frame(height:35)
                .padding(.vertical)
                .scrollContentBackground(.hidden)
                Spacer()
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        let selectedCountry = Country.allCases[countryIndex]
                        ForEach(selectedCountry.helplineNumbers, id: \.name) { helpline in
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
