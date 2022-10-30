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
    @State private var savedPalettes: [SavedPalette] = [] //empty
    
    
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
                    
                },
                       label: {
                    Text("Save")
                    .font(.subheadline.smallCaps())
                          })
                .buttonStyle(.bordered)
            }
          
            Spacer()
            
        }
        .padding()
    }
    
    //MARK: Functions
    func savedPalette() {
        let newPalette = savedPalette(hue: hue)
            .savedPalettes.append(newPalette)
        print(
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
