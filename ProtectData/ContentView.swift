//
//  ContentView.swift
//  ProtectData
//
//  Created by Dev.SHooooooQ on 04/03/1446 AH.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = WidgetViewModel()
    
    var body: some View {
        VStack {
            if let widget = viewModel.widgetText {
                Text("Widget name: \(widget.data)")
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
        }.onAppear {
            viewModel.loadWidget()
        }
    }
}
