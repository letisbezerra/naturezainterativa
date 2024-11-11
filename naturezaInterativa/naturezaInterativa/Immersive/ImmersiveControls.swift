//
//  ImmersiveControls.swift
//  VisionOS_Test
//
//  Created by Ana Flávia Torres do Carmo on 10/11/24.
//


import SwiftUI

/// The control panel to display along with the immersive view.
struct ImmersiveControls: View {
    @Environment(ViewModel.self) private var model
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                HStack {
                    Button {
                        withAnimation { model.animalCount -= 1 }
                    } label: {
                        Label("Previous", systemImage: "chevron.left")
                    }
                    .disabled(model.animalCount == 0)
                    .padding()
                    
                    Spacer()
                    
                    Text(model.module.animal[model.animalCount])
                        .font(.title)
                    
                    Spacer()
                    
                    Button {
                        withAnimation { model.animalCount += 1 }
                    } label: {
                        Label("Next", systemImage: "chevron.right")
                    }
                    .disabled(model.animalCount == model.module.funFacts.count - 1)
                    .padding()
                }
                .labelStyle(.iconOnly)
                
                ZStack {
                    ForEach(model.module.funFacts, id: \.self) { fact in
                        Text(fact)
                            .foregroundStyle(.secondary)
                            .padding(.horizontal)
                            .opacity(fact == model.module.funFacts[model.animalCount] ? 1 : 0)
                    }
                }
                .animation(.default, value: model.animalCount)
                
                Divider()
                    .padding()
                
                Button {
                    Task {
                        model.isShowingImmersive = false
                        model.animalCount = 0
                    }
                } label: {
                    Label(
                        "Exit",
                        systemImage: "arrow.down.right.and.arrow.up.left")
                }
                .buttonStyle(.borderless)
                .padding(.bottom)
            }
            .frame(width: 500)
            .glassBackgroundEffect(in: .rect(cornerRadius: 40))
        }
    }
}

//#Preview {
//    ImmersiveControls()
//        .environmentObject(ViewModel())
//}
