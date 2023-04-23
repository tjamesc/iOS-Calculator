//
//  SettingsView.swift
//  fp01_calculator
//
//  Created by Thomas J Carriero on 4/23/23.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var background: Color
    @Binding var bolden: Bool
    
    var body: some View {
        Form {
            Section {
                Picker("Choose a background color", selection: $background) {
                    Text("Black").tag(Color.black)
                    Text("Blue").tag(Color.blue)
                    Text("Green").tag(Color("dg"))
                    Text("Pink").tag(Color("pink"))
                }
                .pickerStyle(.segmented)
            } header: { Text("Colors") }
        }
    }
}
