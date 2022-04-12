//
//  CompletedList.swift
//  Productive3
//
//  Created by taekkim on 2022/04/12.
//

import SwiftUI

struct CompletedList: View {
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    var body: some View {
            VStack (alignment: .leading){
                HStack (alignment: .center) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color(red: 0.9568627450980393, green: 0.7803921568627451, blue: 0.6705882352941176))
                    Text("아침에 일어나서 샤워하기")
                        //.fixedSize(horizontal: false, vertical: true)
                }.padding(screenWidth * 0.01)
                HStack (alignment: .center) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color(red: 0.9568627450980393, green: 0.7803921568627451, blue: 0.6705882352941176))
                    Text("비타민 챙겨먹기")
                }.padding(screenWidth * 0.01)
                HStack (alignment: .center) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color(red: 0.9568627450980393, green: 0.7803921568627451, blue: 0.6705882352941176))
                    Text("집 앞에 영일대 산책 다녀오기")
                }.padding(screenWidth * 0.01)
            }.padding(.horizontal, screenWidth * 0.13).padding(.top, screenHeight * 0.03)//.frame(width: h.size.width * 0.7)
    }
}

struct CompletedList_Previews: PreviewProvider {
    static var previews: some View {
        CompletedList()
    }
}
