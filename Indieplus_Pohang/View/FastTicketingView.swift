//
//  FastTicketingView.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/17.
//

import SwiftUI

struct FastTicketingView: View {
    var body: some View {
        Button {} label : {
            ZStack {
                Rectangle()
                    .frame(width: 100, height: 40)
                    .foregroundColor(Color.main)
                    .cornerRadius(10, corners: [.bottomLeft, .topLeft])
                
                Text("빠른 예매")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.black)
            }
        }.offset(x: 151, y: 318)
    }
}

struct FastTicketingView_Previews: PreviewProvider {
    static var previews: some View {
        FastTicketingView()
    }
}
