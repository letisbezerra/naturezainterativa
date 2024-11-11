//
//  AppModel.swift
//  VisionOS_Test
//
//  Created by Ana Flávia Torres do Carmo on 05/11/24.
//

import SwiftUI

/// The data that the app uses to configure its views.
@Observable
class ViewModel {

    // MARK: - Navigation
    var module: Module = .savanna
    var titleText: String = ""
    var isTitleFinished: Bool = false
    var finalTitle: String = "Animal Planet"
    // MARK: - Immersive
    var isShowingImmersive: Bool = false
    var animalCount = 0
}
