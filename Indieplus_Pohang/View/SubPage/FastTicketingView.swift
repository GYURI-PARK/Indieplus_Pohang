//
//  FastTicketingView.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/17.
//

import SwiftUI

struct FastTicketingView: View {
    @ObservedObject var viewModel: TicketingWebViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationLink(destination: TicketingWebView(urlToLoad: "https://www.dtryx.com/cinema/main.do?cgid=FE8EF4D2-F22D-4802-A39A-D58F23A29C1E&BrandCd=indieart&CinemaCd=000057", viewModel: viewModel)) {
            ZStack {
                Rectangle()
                    .frame(width: 100, height: 40)
                    .foregroundColor(Color.main)
                    .cornerRadius(10, corners: [.bottomLeft, .topLeft])
                
                Text("빠른 예매")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.black)
            }
        }
        .offset(x: 151, y: 318)
    }
}

//struct FastTicketingView_Previews: PreviewProvider {
//    static var previews: some View {
//        FastTicketingView()
//    }
//}
