//
//  NewToDoView.swift
//  ToDoApp
//
//  Created by Scholar on 7/18/23.
//

import SwiftUI

struct NewToDoView: View {
    @State var title: String
    @State var isImportant: Bool
    @Binding var toDoItems: [ToDoItem]
    
    var body: some View {
        VStack {
           Text ("Task Title:")
                .font(.largeTitle)
            TextField("Enter the Task Description...", text: $title)
            
            Toggle(isOn: $isImportant){
                Text("Is it Important?")
                Button(action: {
                    self.addTask(title: self.title, isImportant: self.isImportant)
                }) {
                    Text("Add")
                    Spacer ()
                }.padding ()
            }
        }.padding ()
    }
    private func addTask(title: String, isImportant: Bool = false) {
            
            let task = ToDoItem(title: title, isImportant: isImportant)
            toDoItems.append(task)
        }
}

struct NewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NewToDoView(title: "", isImportant: false, toDoItems: .constant([]))
    }
}
