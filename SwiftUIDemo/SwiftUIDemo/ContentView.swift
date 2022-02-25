//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Ion Jaureguialzo Sarasola on 25/2/22.
//

import SwiftUI

struct ContentView: View {

    // REF: Cloud Firestore: https://firebase.google.com/docs/firestore
    // REF: Firestore in Swift tutorial: https://blog.logrocket.com/firestore-swift-tutorial/

    @ObservedObject private var vm = TareasViewModel()

    @State private var tarea: String = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Tarea...", text: $tarea)
                        .padding()
                        .border(Color.black)

                    Button(action: {
                        self.vm.add(nombre: tarea)
                        tarea = ""
                    }) {
                        Text("Añadir tarea")
                    }.padding()
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(5)
                }.padding(.horizontal, 20)

                List(vm.tareas) { tarea in
                    VStack(alignment: .leading) {
                        Text(tarea.nombre ?? "")
                    }
                }.onAppear() {
                    self.vm.all()
                }.navigationTitle("Tareas")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
