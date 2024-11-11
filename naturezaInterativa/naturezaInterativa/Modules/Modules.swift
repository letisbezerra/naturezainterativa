//
//  Modules.swift
//  VisionOS_Test
//
//  Created by Ana Flávia Torres do Carmo on 10/11/24.
//

import SwiftUI

/// The top level navigation stack for the app.
struct Modules: View {
    @Environment(ViewModel.self) private var model
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    var body: some View {
        
        ZStack {
            // Controls visible only when showing the immersive view.
            ImmersiveControls()
                .opacity(model.isShowingImmersive ? 1 : 0)
            
            // The main navigation element for the app.
            TableOfContents()
                .opacity(model.isShowingImmersive ? 0 : 1)
        }
        .animation(.easeInOut, value: model.isShowingImmersive)
        .onChange(of: model.isShowingImmersive) { isShowing in
            if !isShowing {
                Task {
                    await dismissImmersiveSpace()  // Fecha o espaço quando isShowingImmersive é false
                }
            }
        }
    }
}

//#Preview {
//    Modules()
//        .environmentObject(ViewModel())
//}

