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
            InsertUserInfoView()
        case "AskToDoView":
            AskToDoView()
        case "InsertToDo":
            InsertTodoView()
        case "ToDoList":
            TodoListView()
        default :
            AskUserInfoView()
        }
    }
}

struct ScreenSwtichView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenSwtichView()
    }
}
