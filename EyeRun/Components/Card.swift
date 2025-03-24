//
//  Card.swift
//  EyeRun
//
//  Created by Jonathan Tjahjadi on 24/03/25.
//

import SwiftUI

struct Card: View {
    var body: some View {
        VStack (alignment: .leading) {
            Text("Distance Traveled")
                .font(.system(size: 20))
                .foregroundColor(.white)
            
            Spacer()
            HStack (alignment: .bottom){
                Text("3.7km")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                Text("/5km")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .opacity(0.7)
            }
        }
        .padding(.vertical)
        .frame(minWidth: 250, maxHeight: 150)
        .background(Color.brandSecondary)
        .cornerRadius(15)
    }
}

#Preview {
    Card()
}
