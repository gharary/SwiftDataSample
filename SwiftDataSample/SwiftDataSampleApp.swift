//
//  SwiftDataSampleApp.swift
//  SwiftDataSample
//
//  Created by Mo Gharari on 19/11/2023.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataSampleApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            SampleModel.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ListSamplesView()
        }
        .modelContainer(sharedModelContainer)
    }
}
