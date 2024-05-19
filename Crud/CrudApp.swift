//
//  CrudApp.swift
//  Crud
//
//  Created by Donizetti de Souza on 5/16/24.
//

import SwiftUI

@main
struct CrudApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(ReadingUserViewModel())
        }
    }
}
