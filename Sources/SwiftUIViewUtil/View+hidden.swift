//
//  View+hidden.swift
//  
//
//  Created by Wilhelm Oks on 29.01.24.
//

import SwiftUI

public extension View {
    @ViewBuilder func hidden(_ hidden: Bool) -> some View {
        if hidden {
            self.hidden()
        } else {
            self
        }
    }
}
