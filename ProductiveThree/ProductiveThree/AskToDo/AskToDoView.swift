//
//  AskToDoView.swift
//  ProductiveThree
//
//  Created by 김태호 on 2022/04/13.
//

import SwiftUI
import RealmSwift

struct AskToDoView: View {
    // Realm
    @ObservedResults(Routine.self) var routines;
    var routine: Routine? {
        routines.where { $0.date == DateToString.resolve(date: Date()) }.first
    }
    
    @Binding var viewState : String
    
    init(viewState: Binding<String>) {
        _viewState = viewState
//        let realmCrud = RealmCRUD.instance
//        realmCrud.mockupRoutine(tasks: ["태권도 학원 가기", "카페가기", "춤추기"], date: "2022-04-09")
//        realmCrud.mockupRoutine(tasks: ["가", "나", "다"], date: "2022-04-10")
//        realmCrud.mockupRoutine(tasks: ["다리 긁기", "머리 흔들기", "책 읽기"], date: "2022-04-11")
//        realmCrud.mockupRoutine(tasks: ["발시렵기", "코딩하기", "안녕"], date: "2022-04-12")
    }
    
    var body: some View {
        if routine == nil {
            InsertTodoView(viewState: $viewState)
        } else {
            TodoListView(routine: routine!)
        }
        // Render TodoList View when routine exists
        // ContentView(routine: routine!)
    }
}

