//
//  SavedPalette.swift
//  ColourSelector
//
//  Created by Noah Alexandre Soubliere on 2022-10-28.
//

import Foundation

struct SavedPalette: Identifiable {
    let id = UUID()
    let hue: Double
    let saturation: Double = 0.8
    let brightness: Double = 0.9
}

//for driving SwiftUi previews

let examplePalette = [
    SavedPalette(hue: 0.1),
    SavedPalette(hue: 0.3),
    SavedPalette(hue: 0.5),
    
]
