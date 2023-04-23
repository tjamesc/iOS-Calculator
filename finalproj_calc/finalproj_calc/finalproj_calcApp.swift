//
//  finalproj_calcApp.swift
//  finalproj_calc
//
//  Created by Thomas J Carriero on 4/23/23.
//

import SwiftUI

@main
struct finalproj_calcApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
