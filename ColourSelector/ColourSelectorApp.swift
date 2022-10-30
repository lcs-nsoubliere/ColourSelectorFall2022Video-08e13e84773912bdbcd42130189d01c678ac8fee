//
//  ColourSelectorApp.swift
//  ColourSelector
//
//  Created by Russell Gordon on 2022-10-27.
//

import SwiftUI

@main
struct ColourSelectorApp: App {
    
    //MARK: Stored properties
    
    //Our list of saved Palettes
    //"Source of truth"
    @State private var savedPalettes: [SavedPalette] = [] //empty
    
    //MARK: computed properties
    
    
    //Windows/ screens that makeup our app
    
    
    var body: some Scene {
        WindowGroup {
            ContentView(savedPalettes: $savedPalettes)
        }
    }
}
