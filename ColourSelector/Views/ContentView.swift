//
//  ContentView.swift
//  ColourSelector
//
//  Created by Russell Gordon on 2022-10-27.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    @State private var selectedHue = 0.0
    
    
    // Our list of monochromatic colour palettes
    //derived Value vv  
    @Binding var savedPalettes: [SavedPalette]
    
    
    // MARK: Computed properties
    
    // The selected hue expressed as a value between 0.0 and 1.0
    private var hue: Double {
        return selectedHue / 360.0
    }
    
    private var baseColour: Color {
        return Color(hue: hue,
                     saturation: 0.8,
                     brightness: 0.9)
    }
    
    // Interface
    var body: some View {
        VStack(spacing: 20){
            
            // Selecting the hue
            HStack{
                ColourSwatchView(colour: baseColour,
                                 size: 100)
                VStack(alignment: .leading){
                    
                    Text("Hue")
                        .bold()
                    
                    Text("\(selectedHue.formatted(.number.precision(.fractionLength(1))))°")
                    
                    Slider(value: $selectedHue,
                           in: 0...360,
                           label: { Text("Hue") },
                           minimumValueLabel: { Text("0") },
                           maximumValueLabel: { Text("360") })
                    
                }
            }
            
            //Monochromatic Palette
            HStack{
                MonochromaticPaletteView(hue: hue)
                
                Spacer()
                
                Button(action: { //save the current palette
                    SavedPalette()
                }, label: {
                    Text("Save")
                        .font(.subheadline.smallCaps())
                })
                .buttonStyle(.bordered)
            }
            
            List(savedPalettes) { palette in
                MonochromaticPaletteView(hue: palette.hue,
                                         showTitle: false)
            }
            
        }
        .padding()
    }
    
    //MARK: Functions
    func SavedPalette() {
        let newPalette = SavedPalette(hue: hue)
            .savedPalettes.append(newPalette)
        print(savedPalettes)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      liveContentView()
    }
    
    //create a view to simulate the app level entry point to contentView connection
    
    struct liveContentView: View{
        
        //populate with some palettes to start
        @State var palettes: [SavedPalette] = examplePalettes
        var body: some View
        ContentView(savedPalettes: $palettes)
        
    }
}
