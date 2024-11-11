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
    
    var body: some View {
        RealityView { content in
            if let animal = loadEntiry() {
                content.add(animal)
            }
        } update: { content in
            guard let animal = content.entities.first else {return}
            
            animal.isEnabled = true
            animal.availableAnimations.forEach { animation in
                animal.playAnimation(animation.repeat())
            }
        }
    }
    private func loadEntiry() -> Entity? {
        try? Entity.load(
            named: animal,
            in: realityKitContentBundle
        )
    }
}

//#Preview(immersionStyle: .mixed){
//        @State var animal = "Giraffe"
//    Animal(animal: animal)
//        .environment(ViewModel())
//}
