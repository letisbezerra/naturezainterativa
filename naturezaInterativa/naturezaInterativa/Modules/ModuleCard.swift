//
//  ModuleCard.swift
//  VisionOS_Test
//
//  Created by Ana Flávia Torres do Carmo on 10/11/24.
//

import SwiftUI

/// A card that displays a navigation destination.
struct ModuleCard: View {
    var module: Module
    @Environment(ViewModel.self) private var model
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(module.eyebrow)
                .font(.callout)
                .bold()
                .foregroundStyle(.secondary)
            VStack(alignment: .leading, spacing: 10) {
                Text(module.heading)
                    .font(.largeTitle)
                Text(module.abstract)
            }
        }
        .padding(.vertical, 30)
        .buttonStyle(.borderless)
        .buttonBorderShape(.roundedRectangle(radius: 20))
        .frame(minWidth: 200, maxWidth: 355)
        .onTapGesture {
            Task {
                model.module = module
                await openImmersiveSpace(id: "immersive")
            }
        }
    }
}

//#Preview {
//    HStack {
//        ModuleCard(module: .polar)
//    }
//    .padding()
//    .glassBackgroundEffect()
//}
