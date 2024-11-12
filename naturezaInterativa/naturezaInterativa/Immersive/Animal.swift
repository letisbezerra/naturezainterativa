//
//  AnimalView.swift
//  VisionOS_Test
//
//  Created by Ana Flávia Torres do Carmo on 06/11/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct Animal: View {
    var animal: String
    @State private var audioPlaybackController: AudioPlaybackController?
    
    
    var body: some View {
        RealityView { content in
            if let entity = loadEntiry() {
                content.add(entity)
                //                if animal != "Jellyfish" && animal != "White Shark" {
                Task {
                    await playAnimalSound(for: entity)
                }
                //                }
            }
        } update: { content in
            guard let entity = content.entities.first else {return}
            
            entity.isEnabled = true
            entity.availableAnimations.forEach { animation in
                entity.playAnimation(animation.repeat())
            }
        }
    }
    private func loadEntiry() -> Entity? {
        try? Entity.load(
            named: animal,
            in: realityKitContentBundle
        )
    }
    
    private func playAnimalSound(for entity: Entity) async {
        guard let entity = entity.findEntity(named: "SpatialAudio"),
              let resource = try? await AudioFileResource(named: "/Root/sound_mp3",
                                                          from: animal+".usda",
                                                          in: realityKitContentBundle) else { return }
        
        let audioPlaybackController = entity.prepareAudio(resource)
        audioPlaybackController.play()
    }
}

//#Preview(immersionStyle: .mixed){
//        @State var animal = "Giraffe"
//    Animal(animal: animal)
//        .environment(ViewModel())
//}
