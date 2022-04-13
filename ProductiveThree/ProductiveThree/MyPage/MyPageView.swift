//
//  MyPageView.swift
//  ProductiveThree
//
//  Created by yeongwoocho on 2022/04/12.
//

import SwiftUI

struct MyPageView: View {
    @State private var showModal = false //상태
    @State private var index: Int?
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    //목록을 1부터 1000까지 만듬
    let data = Array(0...6)
    
    //화면을 그리드형식으로 꽉채워줌
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let baseImageURL = "https://storage.googleapis.com/no-ri"
    
    func getImageURL(index: Int) -> String {
        return baseImageURL + "/\(index).png"
    }
    
    var body: some View {
        VStack {
            Text("뭐든 미친듯이")
                .fontWeight(.light)
                .font(.system(size: 17))
            
            Spacer()
            
            Text("Ginger")
                .fontWeight(.semibold)
                .font(.system(size: 25))
            
            Divider()
                .padding([.top, .bottom], 10)
                .padding([.leading, .trailing], 20)
            
            Text("총 \(data.count)일의 실천완료~!")
                .fontWeight(.medium)
                .font(.system(size: 17))
                .foregroundColor(Color.init(hex: "92C4CD"))
            
            Divider()
                .padding([.top], 10)
                .padding([.leading, .trailing], 20)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(data, id: \.self) { index in
                        AsyncImage(url: URL(string: getImageURL(index: index))){
                            $0.resizable()
                                .scaledToFill()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(20)
                        } placeholder: {
                            ProgressView()
                        }
                        .onTapGesture {
                            self.showModal = true
                            self.index = index
                        }
                    }
                    .sheet(isPresented: self.$showModal) {
                        MyPageDetailView(index: self.$index, showModal: self.$showModal)
                    }
                }
            }
            .padding([.horizontal, .vertical], 10)
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.mode.wrappedValue.dismiss()
        }){
            HStack {
                Image("chevron.backward")
                    .renderingMode(.template)
                    .foregroundColor(Color.OLIVE_8)
                Text("Todo")
                    .foregroundColor(Color.OLIVE_8)
            }
        }, trailing: NavigationLink(destination: EditUserInfoView()){
            Image("gearshape.fill")
                .renderingMode(.template)
                .foregroundColor(Color.OLIVE_8)
        })
        
    }
}


struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
