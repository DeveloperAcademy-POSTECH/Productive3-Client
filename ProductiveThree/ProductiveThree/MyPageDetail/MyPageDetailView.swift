//
//  MyPageDetailView.swift
//  ProductiveThree
//
//  Created by yeongwoocho on 2022/04/12.
//

import SwiftUI
import Realm
import RealmSwift
import Kingfisher

struct MyPageDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var element: Routine?
    
    @Binding var showModal: Bool
    
    mutating func setElement(element: Routine) {
        self.element = element
    }
    
    var body: some View{
        GeometryReader { metrics in
            VStack{
                HStack(alignment: .center) {
                    ZStack {
                        Text(element?.date ?? "상세보기")
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        HStack{
                            Spacer()
                            Button {
                                self.showModal = false
                            } label: {
                                Image(systemName: "xmark")
                                    .font(.system(size: 25))
                                    .tint(Color.init(hex: "BFBFBF"))
                            }
                            .padding(.trailing, 25)
                        }
                    }
                }
                .padding(.top, 40)
                
                KFImage(URL(string: element!.imgUrl!))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: metrics.size.width * 0.8, height: metrics.size.width * 0.8)
                    .cornerRadius(/*@START_MENU_TOKEN@*/40.0/*@END_MENU_TOKEN@*/)
                    .padding(.vertical, metrics.size.height * 0.05)
                    .shadow(radius:7)
                Divider()
                Text("실천 완료한 할 일 3가지").font(.system(size: 20)).foregroundColor(Color(hue: 0.0, saturation: 0.0, brightness: 0.0, opacity: 0.658) ).padding([.top, .bottom], metrics.size.height * 0.02)
                Divider()
                VStack {
                    CompletedList(contents: element!.contents)
                    Spacer()
                }
            }
        }
    }
}

struct CompletedList: View {
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    var contents: RealmSwift.List<Content>
    
    init(contents: RealmSwift.List<Content>) {
        self.contents = contents
    }
    
    var body: some View {
            VStack (alignment: .leading){
                HStack (alignment: .center) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color(red: 0.9568627450980393, green: 0.7803921568627451, blue: 0.6705882352941176))
                    Text(contents[0].content)
                        //.fixedSize(horizontal: false, vertical: true)
                }.padding(screenWidth * 0.01)
                HStack (alignment: .center) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color(red: 0.9568627450980393, green: 0.7803921568627451, blue: 0.6705882352941176))
                    Text(contents[1].content)
                }.padding(screenWidth * 0.01)
                HStack (alignment: .center) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color(red: 0.9568627450980393, green: 0.7803921568627451, blue: 0.6705882352941176))
                    Text(contents[2].content)
                }.padding(screenWidth * 0.01)
            }.padding(.horizontal, screenWidth * 0.13).padding(.top, screenHeight * 0.03)//.frame(width: h.size.width * 0.7)
    }
}
