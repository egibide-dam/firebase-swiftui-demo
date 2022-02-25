//
//  TareasViewModel.swift
//  SwiftUIDemo
//
//  Created by Ion Jaureguialzo Sarasola on 25/2/22.
//

import Foundation
import FirebaseFirestore

class TareasViewModel: ObservableObject {

    // REF: Actualizaciones en tiempo real: https://firebase.google.com/docs/firestore/query-data/listen
    // REF: Agregar un documento: https://firebase.google.com/docs/firestore/manage-data/add-data#add_a_document

    @Published var tareas = [Tarea]()

    private var db = Firestore.firestore()

    func all() {
        db.collection("tareas").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("ERROR: No hay documentos")
                return
            }

            self.tareas = documents.map { (queryDocumentSnapshot) -> Tarea in
                let data = queryDocumentSnapshot.data()
                let nombre = data["nombre"] as? String ?? ""
                return Tarea(nombre: nombre)
            }
        }
    }

    func add(nombre: String) {
        db.collection("tareas").addDocument(data: ["nombre": nombre])
    }
}
