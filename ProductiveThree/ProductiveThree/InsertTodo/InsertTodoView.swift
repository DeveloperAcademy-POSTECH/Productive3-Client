//
//  InsertTodoView.swift
//  ProductiveThree
//
//  Created by yeongwoocho on 2022/04/12.
//

import SwiftUI
import Combine
import RealmSwift

struct InsertTodoView: View {
    @Binding var viewState : String
    @State var newToDoList = [
        toDoInput(index: 0, input: ""),
        toDoInput(index: 1, input: ""),
        toDoInput(index: 2, input: "")
    ]
    
    
    var titleBox : some View{
        VStack(alignment: .leading, spacing: 8.0){
            HStack {
                Text("오늘 나에게 \n중요한 3가지")
                    .font(.system(size: 27))
                    .fontWeight(.semibold)
                Spacer()
            }
            Text("오늘 내가 할 일들로 빈칸을 채워주세요")
                .font(.system(size: 14))
                .fontWeight(.light)
                .foregroundColor(Color(red: 115/255, green: 115/255, blue: 115/255))
        }
        .frame(width: 336.0)
        .padding(.bottom, 36.0)
    }
    
    var body: some View {
        ZStack {
            Color(red: 251/255, green: 251/255, blue: 251/255).edgesIgnoringSafeArea(.all)
            VStack{
                titleBox
                ForEach(0 ..< 3){ index in
                    ProductiveThree.toDoInputRow(newToDo: $newToDoList[index].input)
                }
                Spacer()
                ProductiveThree.ButtonBox(newToDoList: $newToDoList, viewState: $viewState)
            }
        }
    }
    
}

struct toDoInput {
    let index: Int
    var input: String = ""
}

struct toDoInputRow: View {
    @Binding var newToDo : String
    
    let textLimit : Int = 20
    
    func limitText(_ upper : Int) {
        if newToDo.count > upper {
            newToDo = String(newToDo.prefix(upper))
        }
    } //limitText
    
    var body: some View {
        HStack(alignment: .center, spacing: 16.0){
            ZStack {
                RoundedRectangle(cornerRadius: 7)
                    .fill(Color(red: 1.0, green: 1.0, blue: 1.0))
                    .shadow(color: Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.1), radius: 4 , x: 0, y: 0)
                    .frame(height: 40)
                
                TextField(
                    "20자 이내로 입력하세요", text: $newToDo
                )
                .onReceive( Just(newToDo)){
                    _ in limitText(textLimit)
                }
                .padding(.horizontal, 27.0)
                
            } //ZStack
            
            if newToDo == "" {
                Circle()
                    .fill(Color(red: 211/255, green: 211/255, blue: 211/255, opacity: 1.0))
                    .frame(width: 40, height: 40)
                    .opacity(1)
            } else {
                Circle()
                    .fill(Color(red: 244/255, green: 199/255, blue: 171/255, opacity: 1.0))
                    .frame(width: 40, height: 40)
            } // if
        }
        .frame(width: 336)
        .padding(.bottom, 22.0)
    } //body
}


struct ButtonBox: View {
    @Binding var newToDoList : [toDoInput]
    @Binding var viewState : String
    
    let realmCrud = RealmCRUD.instance
    
    func isNotBlankFn (str1: String, str2: String, str3: String)-> Bool {
        if !str1.isEmpty && !str1.isEmpty && !str3.isEmpty {
            return true
        }
        return false
    }
    
    func createToDoList(){
        let toDoList : [String] = [newToDoList[0].input,newToDoList[1].input,newToDoList[2].input]
        realmCrud.createRoutine(tasks: toDoList)
    }
    
    var body: some View {
        VStack {
            if isNotBlankFn(str1: newToDoList[0].input, str2:  newToDoList[1].input, str3:  newToDoList[2].input) {
                Text("버튼 터치 후 수정이 불가능합니다")
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(Color(red: 115/255, green: 115/255, blue: 115/255))
            }
            ZStack{
                Button(action: {print("버튼이 눌렸습니다")}){
                    Text("실천하러 가기")
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.8274509803921568, green: 0.8274509803921568, blue: 0.8274509803921568))
                }
                .padding(.horizontal, 10.0)
                .padding(.vertical, 15.0)
                .background(RoundedRectangle(cornerRadius: 7).fill(Color(red: 255/255, green: 255/255, blue: 255/255)).frame(width: 336)
                    .shadow(color: Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.1), radius: 3 , x: 0, y: 0))
                .frame(width:336, height: 54.0)
                .disabled(true)
                //disabled Button
                
                if isNotBlankFn(str1: newToDoList[0].input, str2:  newToDoList[1].input, str3:  newToDoList[2].input) {
                    Button(action: {
                        createToDoList()
                        viewState = "ToDoList"
                    }){
                        Text("실천하러 가기")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 60/255, green: 60/255, blue: 60/255))
                    }
                    .padding(.horizontal, 10.0)
                    .padding(.vertical, 15.0)
                    .background(RoundedRectangle(cornerRadius: 7).fill(Color(red: 244/255, green: 199/255, blue: 171/255)).frame(width: 336).shadow(color: Color(red: 0.49411764705882355, green: 0.49411764705882355, blue: 0.49411764705882355, opacity: 0.15), radius: 7, x: 0, y: 0))
                    .frame(width:336, height: 54.0)
                    
                } //albed Button
            }
        } //ZStack
    }
} //ButtonBox
