//
//  MyPageDetailView.swift
//  ProductiveThree
//
//  Created by yeongwoocho on 2022/04/12.
//

import SwiftUI

struct MyPageDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var index: Int?
    @Binding var showModal: Bool
    
    mutating func setIndex(index: Int) {
        self.index = index
    }
    
    var body: some View{
        GeometryReader { metrics in
            VStack{
                HStack(alignment: .center) {
                    ZStack {
                        Text("22.04.11 (월)")
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
                
                AsyncImage(url: URL(string: "https://storage.googleapis.com/no-ri/\(index!).png")){ image in
                    
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }.frame(width: metrics.size.width * 0.7, height: metrics.size.width * 0.7).cornerRadius(/*@START_MENU_TOKEN@*/40.0/*@END_MENU_TOKEN@*/).padding(.vertical, metrics.size.height * 0.06).shadow(radius:7)
                Divider()
                Text("실천 완료한 할 일 3가지").font(.system(size: 20)).foregroundColor(Color(hue: 0.0, saturation: 0.0, brightness: 0.0, opacity: 0.658) ).padding([.top, .bottom], metrics.size.height * 0.02)
                Divider()
                VStack {
                    CompletedList()
                    Spacer()
                }
            }// VStack
            .navigationBarTitle("22.04.11 (월)", displayMode: .inline)
            .navigationBarItems(trailing: HStack {
                Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                    Image(systemName: "xmark")
                }
            })
        }
    }// body
}

//struct MyPageDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyPageDetailView()
//    }
//}

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
