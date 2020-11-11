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
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                CarouselView(width: width, height: geo.frame(in: .global).height, page: $page, items: items.count)
            }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ZStack() {
                VStack {
                    Spacer()
                    PageControlView(items: WelcomeCard.GetCards().count, page: $page)
                }
            }
        }
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
