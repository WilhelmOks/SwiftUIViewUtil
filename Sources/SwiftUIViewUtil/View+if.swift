//
//  View+if.swift
//  
//
//  Created by Wilhelm Oks on 29.01.24.
//

import SwiftUI

public extension View {
    @ViewBuilder func `if`<IfView>(_ condition: Bool, modifier: (Self) -> IfView) -> some View where IfView: View {
        if condition {
            modifier(self)
        } else {
            self
        }
    }
    
    @ViewBuilder func `if`<IfView, ElseView>(_ condition: Bool, modifier: (Self) -> IfView, else elseModifier: (Self) -> ElseView) -> some View where IfView: View, ElseView: View {
        if condition {
            modifier(self)
        } else {
            elseModifier(self)
        }
    }
    
    @ViewBuilder func ifLet<T, IfView>(_ value: T?, modifier: (Self, T) -> IfView) -> some View where IfView: View {
        if let value {
            modifier(self, value)
        } else {
            self
        }
    }
}

struct If_Previews: PreviewProvider {
    static var previews: some View {
        let yellowBackground = true
        let greenBackground = false
        let optionalColor: Color? = .orange

        VStack(spacing: 10) {
            Text("test if")
                .if(yellowBackground) {
                    $0.background(Color.yellow)
                }
            
            Text("test if else")
                .if(greenBackground) {
                    $0.background(Color.green)
                } else: {
                    $0.background(Color.cyan)
                }

            Text("test if let")
                .ifLet(optionalColor) { view, value in
                    view.background(value)
                }
        }
    }
}
