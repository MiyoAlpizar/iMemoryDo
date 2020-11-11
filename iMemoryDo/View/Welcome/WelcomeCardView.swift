//
//  WelcomeCardView.swift
//  iMemoryDo
//
//  Created by Miyo Alpízar on 10/11/20.
//

import SwiftUI

struct WelcomeCardView: View {
    @Binding var page: Int
    var data: WelcomeCard
    var width: CGFloat
    var body: some View {
        VStack {
            ZStack {
                data.color.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    Spacer()
                    Text(data.title)
                        .font(.system(size: 32))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    
                    Image(data.img)
                        .resizable()
                        .scaledToFit()
                        .padding()
                    
                    Text(data.description)
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }.padding()
                
            }
        }.frame(width: self.width)
        .animation(.default)
    }
}

struct WelcomeCardView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeCardView(page: .constant(0), data: WelcomeCard.GetCards()[0], width: UIScreen.main.bounds.width)
    }
}
