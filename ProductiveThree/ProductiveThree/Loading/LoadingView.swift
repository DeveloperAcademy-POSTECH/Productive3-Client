//
//  LoadingView.swift
//  ProductiveThree
//
//  Created by yeongwoocho on 2022/04/12.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        GeometryReader { metrics in
            VStack {
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Image("logo")
                        .resizable()
                        .frame(width: metrics.size.width * 0.35, height: metrics.size.width * 0.35)
                    
                    Spacer()
                    
                } // HStack
                
                Spacer()
                
            } // VStack
            .background(Color(red: 251/255, green: 251/255, blue: 251/255))
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
