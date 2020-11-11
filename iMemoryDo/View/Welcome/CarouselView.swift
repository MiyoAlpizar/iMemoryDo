//
//  CarouselView.swift
//  iMemoryDo
//
//  Created by Miyo Alpízar on 10/11/20.
//

import Foundation
import SwiftUI


struct CarouselView: UIViewRepresentable {
    
    func makeCoordinator() -> Coordinator {
        return CarouselView.Coordinator(parent: self)
    }
    
    
    var width: CGFloat
    var height: CGFloat
    @Binding var page: Int
    var items: Int
    var action: (_ page: Int) -> Void
    
    func makeUIView(context: Context) -> UIScrollView {
        let total = width * CGFloat(items)
        let view = UIScrollView()
        view.isPagingEnabled = true
        view.contentSize = CGSize(width: total, height: 1.0)
        view.bounces = true
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.delegate = context.coordinator
        let v = UIHostingController(rootView: WelcomeListView(page: $page))
        v.view.frame = CGRect(x: 0, y: 0, width: total, height: height)
        v.view.backgroundColor = .clear
        view.addSubview(v.view)
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        var parent : CarouselView
        init(parent: CarouselView) {
            self.parent = parent
        }
        
        func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
            let page = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
            parent.action(page)
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let page = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
             print(page)
            self.parent.page = page
            parent.action(page)
        }
    }
}


struct PageControlView: UIViewRepresentable {
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
