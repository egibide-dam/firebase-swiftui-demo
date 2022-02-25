//
//  Tarea.swift
//  SwiftUIDemo
//
//  Created by Ion Jaureguialzo Sarasola on 25/2/22.
//

import Foundation
import SwiftUI

struct Tarea: Codable, Identifiable {
    var id: String = UUID().uuidString
    var nombre: String?
}
