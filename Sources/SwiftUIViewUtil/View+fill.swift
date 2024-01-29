//
//  View+fill.swift
//  
//
//  Created by Wilhelm Oks on 29.01.24.
//

import SwiftUI

public extension View {
    @ViewBuilder func fill() -> some View {
        self.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    @ViewBuilder func fill(_ alignment: Alignment) -> some View {
        self.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
    }
    
    @ViewBuilder func fillHorizontally() -> some View {
        self.frame(maxWidth: .infinity)
    }
    
    @ViewBuilder func fillHorizontally(_ alignment: Alignment) -> some View {
        self.frame(maxWidth: .infinity, alignment: alignment)
    }
    
    @ViewBuilder func fillVertically() -> some View {
        self.frame(maxHeight: .infinity)
    }
    
    @ViewBuilder func fillVertically(_ alignment: Alignment) -> some View {
        self.frame(maxHeight: .infinity, alignment: alignment)
    }
}

struct Fill_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 8) {
            Text("normal")
                .background(Color.yellow)
            
            Text(".fillHorizontally()")
                .fillHorizontally()
                .background(Color.yellow)
            
            Text(".fillHorizontally(.leading)")
                .fillHorizontally(.leading)
                .background(Color.yellow)
            
            Text(".fillVertically()")
                .fillVertically()
                .background(Color.yellow)
            
            Text(".fill()")
                .fill()
                .background(Color.yellow)
            
            Text(".fill(.topTrailing)")
                .fill(.topTrailing)
                .background(Color.yellow)
        }
        .padding()
    }
}
