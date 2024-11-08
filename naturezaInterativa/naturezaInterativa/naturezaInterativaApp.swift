//
//  naturezaInterativaApp.swift
//  naturezaInterativa
//
//  Created by Leticia Bezerra on 08/11/24.
//

import SwiftUI

@main
struct naturezaInterativaApp: App {
    
    @State var loader = EnvironmentLoader()
    
    var body: some Scene {
        
        WindowGroup(id: "Window") {
            ContentView(loader: loader)
        }
        .windowStyle(.volumetric)
        
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView(loader: loader)
        }
        .immersionStyle(selection: .constant(.full), in: .full)
    }

}
