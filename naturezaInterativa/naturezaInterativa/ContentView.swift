////
////  ContentView.swift
////  naturezaInterativa
////
////  Created by Leticia Bezerra on 08/11/24.
////
//
//import SwiftUI
//import RealityKit
//import RealityKitContent
//
//struct ContentView: View {
//
//    @State var enlarge = false
//    @State var loader: EnvironmentLoader
//    
//    let root = Entity()
//    let portalPlane = ModelEntity(
//        mesh: .generatePlane(width: 1.0, depth: 1.0),
//        materials: [PortalMaterial()]
//    )
//    
//    @Environment(\.openImmersiveSpace) var openImmersiveSpace
//    @Environment(\.dismissWindow)  var dismissWindow
//
//    var body: some View {
//        ZStack {
//            GeometryReader3D { geometric in
//                RealityView { content in
//                    // Loading the environment and putting it in a portal
//                    let zoo = Entity()
//                    zoo.components.set(WorldComponent())
//                    zoo.addChild(try! await loader.getEntity())
//                    let scale: Float = 0.2
//                    zoo.scale *= scale
//                    zoo.position.y -= scale * 1.5
//                    root.addChild(zoo)
//                    content.add(root)
//                    portalPlane.components.set(PortalComponent(target: zoo))
//                    root.addChild(portalPlane)
//                } update: { content in
//                    // Updating the size of the portal when the window is resized
//                    let size =  content.convert(geometric.size, from: .local, to: .scene)
//                    portalPlane.model?.mesh = .generatePlane(
//                        width: size.x,
//                        height: size.y,
//                        cornerRadius: 0.1
//                    )
//                }
//                .frame(depth: 0.4)
//            }
//            .frame(depth: 0.4)
//              
//            VStack {
//                //Button to open the ImmersiveSpace
//                Button("Entrar") {
//                    Task {
//                        await openImmersiveSpace(id: "ImmersiveSpace")
//                        dismissWindow()
//                    }
//                }
//                .glassBackgroundEffect()
//            }
//        }
//    }
//}
//
//#Preview(windowStyle: .volumetric){
//    ContentView(loader: EnvironmentLoader())
//}
