//
//  ImmersiveView.swift
//  VisionOS_Test
//
//  Created by Ana Flávia Torres do Carmo on 05/11/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    @Environment(ViewModel.self) private var model

    var body: some View {
        ZStack {
            Animal(animal: model.module.animal[model.animalCount])
                .id(model.animalCount)
            
            Field(field: model.module.name, sound: model.module.backSound)
        }
        .onAppear {
            model.isShowingImmersive = true
        }
        .onDisappear {
            model.isShowingImmersive = false
        }
    }
}

//#Preview(immersionStyle: .mixed) {
//    ImmersiveView()
//        .environment(ViewModel())
//}
