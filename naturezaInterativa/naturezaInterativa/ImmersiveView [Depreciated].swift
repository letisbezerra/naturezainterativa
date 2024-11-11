////
////  ImmersiveView.swift
////  naturezaInterativa
////
////  Created by Leticia Bezerra on 08/11/24.
////
//
//import SwiftUI
//import RealityKit
//import RealityKitContent
//
//struct ImmersiveView: View {
//    
//    var loader: EnvironmentLoader
//    
//    @Environment(\.scenePhase) var scenePhase
//    @Environment(\.openWindow) var openWindow
//    
//    var body: some View {
//        RealityView { content in
//            content.add(try! await loader.getEntity())
//        }
//        .onDisappear {
//            openWindow(id: "Window")
//        }
//    }
//}
//
//#Preview {
//    ImmersiveView(loader: .init())
//        .previewLayout(.sizeThatFits)
//}
