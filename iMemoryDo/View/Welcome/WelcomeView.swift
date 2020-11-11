//
//  WelcomeView.swift
//  iMemoryDo
//
//  Created by Miyo Alpízar on 10/11/20.
//

import SwiftUI

struct WelcomeView: View {
    var items = WelcomeCard.GetCards()
    @State var x: CGFloat = 0
    @State var count: Int = 0
    @State var width = UIScreen.main.bounds.width
    @State var page = 0
    @State var bgColor = Color.Accent
    @State var isButtonAvailbale = false
    @State var buttonOpacity: Double = 1
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                CarouselView(width: width, height: geo.frame(in: .global).height, page: $page, items: items.count) { page in
                    bgColor = items[page].color
                    isButtonAvailbale = page == items.count - 1
                    buttonOpacity = page == items.count - 1 ? 1 : 0
                }
            }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ZStack() {
                VStack {
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Start Now")
                    }).opacity(buttonOpacity)
                    .animation(.easeIn)
                    
                    PageControlView(items: WelcomeCard.GetCards().count, page: $page)
                }
            }
        }.background(bgColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
    }
}

struct WelcomeListView: View {
    @Binding var page: Int
    var body: some View {
        HStack(spacing: 0) {
            ForEach(WelcomeCard.GetCards()) {i in
                WelcomeCardView(page: $page, data: i, width: UIScreen.main.bounds.width)
            }
        }
    }
}
struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
