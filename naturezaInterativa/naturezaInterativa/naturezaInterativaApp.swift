//
//  naturezaInterativaApp.swift
//  naturezaInterativa
//
//  Created by Leticia Bezerra on 08/11/24.
//

import SwiftUI
import RealityKitContent

@main
struct naturezaInterativaApp: App {
    // The view model.
    @State private var model = ViewModel()
    
    init() {
        RealityKitContent.GestureComponent.registerComponent()
    }
    
    var body: some Scene {
        // The main window that presents the app's modules.
        WindowGroup(id: "modules") {
            Modules()
                .environment(model)
        }
        .windowStyle(.plain)
        // An immersive Space that shows the animals.
        ImmersiveSpace(id: "immersive") {
            ImmersiveView()
                .environment(model)
        }
        .immersionStyle(selection: .constant(.full), in: .full)
    }
}
