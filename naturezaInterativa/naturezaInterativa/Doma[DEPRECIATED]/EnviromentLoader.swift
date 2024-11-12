////
////  EnviromentLoader.swift
////  naturezaInterativa
////
////  Created by Leticia Bezerra on 08/11/24.
////
//
//import RealityKit
//import RealityKitContent
//
//actor EnvironmentLoader {
//    
//    private weak var entity: Entity?
//    
//    func getEntity() async throws -> Entity {
//        if let entity = entity { return  entity }
//        let entity = try await Entity(named: "esfera", in: realityKitContentBundle)
//        self.entity = entity
//        return entity
//    }
//}
