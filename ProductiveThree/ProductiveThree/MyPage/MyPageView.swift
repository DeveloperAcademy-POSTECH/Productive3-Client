//
//  MyPageView.swift
//  ProductiveThree
//
//  Created by yeongwoocho on 2022/04/12.
//

import SwiftUI

struct MyPageView: View {
    @State private var showModal = false //상태
    
    //목록을 1부터 1000까지 만듬
    let data = Array(0...71)
    
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
            HStack {
                Spacer()
                Button {
                    print("문서")
                } label: {
                    Image(systemName: "note.text")
                        .font(.system(size: 33))
                        .tint(Color.init(hex: "BFBFBF"))
                }
                .padding(.trailing, 25)
                Button {
                    print("사람")
                } label: {
                    Image(systemName: "person.fill")
                        .font(.system(size: 33))
                        .tint(Color.init(hex: "BFBFBF"))
                }
                .padding(.trailing, 15)
            }
            .padding([.top, .bottom], 20)
            
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
                        } placeholder: {
                            ProgressView()
                        }
                        .onTapGesture {
                            print("\(index)번째 사진 선택")
                            self.showModal = true
                        }
                        .sheet(isPresented: self.$showModal) {
                            MyPageDetailView()
                        }
                        
                    }
                }
                .padding([.horizontal, .vertical], 10)
            }
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
