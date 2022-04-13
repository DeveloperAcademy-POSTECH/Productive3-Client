//
//  ScreenSwtichView.swift
//  ProductiveThree
//
//  Created by 김태호 on 2022/04/13.
//

import SwiftUI

struct ScreenSwtichView: View {
    @State var viewState = "AskUserInfo"
    var body: some View {
        switch viewState {
        case "InsertUserInfo":
            InsertUserInfoView(viewState: $viewState)
        case "AskToDoView":
            AskToDoView(viewState: $viewState)
        case "InsertToDo":
            InsertTodoView(viewState: $viewState)
//        case "ToDoList":
//            TodoListView()
        default :
            AskUserInfoView(viewState: $viewState)
        }
    }
}

struct ScreenSwtichView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenSwtichView()
    }
}
