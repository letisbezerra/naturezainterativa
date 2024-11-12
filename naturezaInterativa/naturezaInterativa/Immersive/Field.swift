//
//  Field.swift
//  VisionOS_Test
//
//  Created by Ana Flávia Torres do Carmo on 06/11/24.
//

import SwiftUI
import RealityKit
import AVFoundation

/// A large sphere that has an image on its inner surface.
///
/// When centered on the viewer, this entity creates the illusion of floating
/// in space.
struct Field: View {
    var field: String
    var sound: String
    //    @StateObject private var soundPlayer = SoundPlayer()
    
    var body: some View {
        RealityView { content in
            // Create a material with a star field on it.
            guard let resource = try? await TextureResource(named: field) else {
                // If the asset isn't available, something is wrong with the app.
                fatalError("Unable to load field texture.")
            }
            var material = UnlitMaterial()
            material.color = .init(texture: .init(resource))
            
            // Attach the material to a large sphere.
            let entity = Entity()
            entity.components.set(ModelComponent(
                mesh: .generateSphere(radius: 1000),
                materials: [material]
            ))
            
            // Ensure the texture image points inward at the viewer.
            entity.scale *= .init(x: -1, y: 1, z: 1)
            
            addSound(to: entity, audioFileName: sound)
            
            content.add(entity)
            
        }
        
    }
    private func addSound(to entity: Entity, audioFileName: String) {
        do {
            // Carrega o arquivo de áudio
            let audioResource = try AudioFileResource.load(named: audioFileName)
            
            // Prepara o controlador de áudio
            let audioController = entity.prepareAudio(audioResource)
//            audioController.gain = 1.0 // Ajuste do volume
            
            audioController.play()
            
            audioController.completionHandler = { [weak audioController] in
                audioController?.play()
            }
        } catch {
            print("Erro ao carregar o som: (error)")
        }
    }
}

