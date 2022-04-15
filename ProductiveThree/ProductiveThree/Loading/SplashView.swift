////
////  SplashView.swift
////  ProductiveThree
////
////  Created by 김유나 on 2022/04/12.
////
//
//import SwiftUI
//
//private let defaultTimeout: TimeInterval = 2.0
//
//struct SplashView<SplashContent: View>: ViewModifier {
//    private let timeout: TimeInterval
//    private let splashContent: () -> SplashContent
//    
//    @State private var isActive = true
//    
//    init(timeout: TimeInterval = defaultTimeout,
//         @ViewBuilder splashContent: @escaping () -> SplashContent) {
//        self.timeout = timeout
//        self.splashContent = splashContent
//    }
//    
//    func body(content: Content) -> some View {
//        if isActive {
//            splashContent()
//                .onAppear {
//                    DispatchQueue.main.asyncAfter(deadline: .now() + timeout) {
//                        withAnimation {
//                            self.isActive = false
//                        }
//                    }
//                }
//        } else {
//            content
//        }
//    }
//}
//
//extension View {
//    func splashView<SplashContent: View>(
//        timeout: TimeInterval = defaultTimeout,
//        @ViewBuilder splashContent: @escaping () -> SplashContent
//    ) -> some View {
//        self.modifier(SplashView(timeout: timeout, splashContent: splashContent))
//    }
//}
