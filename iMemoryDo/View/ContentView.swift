//
//  ContentView.swift
//  iMemoryDo
//
//  Created by Miyo Alpízar on 30/10/20.
//

import SwiftUI



struct ContentView: View {
    
    @State var x: CGFloat = 0
    @State var count: Int = 0
    @State var screen = UIScreen.main.bounds.width
    @State var page = 0
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Carousel(width: screen, height: geo.frame(in: .global).height, page: $page, items: data.count)
            }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ZStack() {
                VStack {
                    Spacer()
                    PageControl(items: data.count, page: $page)
                }
            }
        }
    }
}

struct List: View {
    @Binding var page: Int
    var body: some View {
        HStack(spacing: 0) {
            ForEach(data.reversed()) {i in
                CardView(page: $page, data: i, width: UIScreen.main.bounds.width)
            }
        }
    }
}

struct Carousel: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        return Carousel.Coordinator(parent: self)
    }
    
    
    var width: CGFloat
    var height: CGFloat
    @Binding var page: Int
    var items: Int
    
    
    func makeUIView(context: Context) -> UIScrollView {
        let total = width * CGFloat(items)
        let view = UIScrollView()
        view.isPagingEnabled = true
        view.contentSize = CGSize(width: total, height: 1.0)
        view.bounces = true
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.delegate = context.coordinator
        let v = UIHostingController(rootView: List(page: $page))
        v.view.frame = CGRect(x: 0, y: 0, width: total, height: height)
        v.view.backgroundColor = .clear
        view.addSubview(v.view)
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        var parent : Carousel
        init(parent: Carousel) {
            self.parent = parent
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let page = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
             print(page)
            self.parent.page = page
        }
    }
}

struct CardView: View {
    @Binding var page: Int
    var data: Card
    var width: CGFloat
    var body: some View {
        VStack {
            ZStack {
                data.color.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    Spacer()
                    Text(data.title)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                    
                    Image(data.img)
                        .resizable()
                        .scaledToFit()
                        .padding()
                    
                    Text(data.description)
                        .font(.body)
                        .foregroundColor(.black)
                    
                    Spacer()
                }.padding()
                
            }
        }.frame(width: self.width)
        .animation(.default)
    }
}

struct PageControl: UIViewRepresentable {
    var items: Int
    @Binding var page: Int
    func makeUIView(context: Context) -> UIPageControl {
        let view = UIPageControl()
        view.currentPageIndicatorTintColor = .black
        view.pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
        view.numberOfPages = items
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        DispatchQueue.main.async {
            uiView.currentPage = page
        }
    }
    
}

struct Card: Identifiable {
    var id: Int
    var title: String
    var description: String
    var img: String
    var show: Bool
    var color: Color
}

var data = [
    Card(id: 0, title: "Primer Instrucción", description: "¿Sabías que si tú haces lo que te voy a decir, estarás bien y mejor?", img: "Brain1", show: false, color: Color.Accent),
    
    Card(id: 1, title: "Primer Instrucción", description: "¿Sabías que si tú haces lo que te voy a decir, estarás bien y mejor?", img: "Brain2", show: false, color: Color.Accent2),
    
    Card(id: 2, title: "Primer Instrucción", description: "¿Sabías que si tú haces lo que te voy a decir, estarás bien y mejor?", img: "Brain3", show: false, color: Color.Accent3),
    
    Card(id: 3, title: "Primer Instrucción", description: "¿Sabías que si tú haces lo que te voy a decir, estarás bien y mejor?", img: "Brain4", show: false, color: Color.Accent4),
    
    Card(id: 4, title: "Primer Instrucción", description: "¿Sabías que si tú haces lo que te voy a decir, estarás bien y mejor?", img: "Brain5", show: false, color: Color.Accent5)
    
    
]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
