//
//  View+size.swift
//  
//
//  Created by Wilhelm Oks on 29.01.24.
//

import SwiftUI

// MARK: - get size

private struct SizePK: PreferenceKey {
    typealias T = CGSize
    static var defaultValue: T = T()
    static func reduce(value: inout T, nextValue: () -> T) {}
}

private struct FrameInGlobalPK: PreferenceKey {
    typealias T = CGRect
    static var defaultValue: T = T()
    static func reduce(value: inout T, nextValue: () -> T) {}
}

public extension View {
    func measureSize<PK: PreferenceKey>(pkType: PK.Type, onChange: @escaping (CGSize) -> Void) -> some View where PK.Value == CGSize {
        self.background(
            GeometryReader { geo in
                Color.clear.preference(key: pkType, value: geo.size)
            }
        )
        .onPreferenceChange(pkType) { newValue in
            onChange(newValue)
        }
    }
    
    func measureSize(onChange: @escaping (CGSize) -> Void) -> some View {
        measureSize(pkType: SizePK.self, onChange: onChange)
    }
}

public extension View {
    func measureFrameInGlobal<PK: PreferenceKey>(pkType: PK.Type, onChange: @escaping (CGRect) -> Void) -> some View where PK.Value == CGRect {
        self.background(
            GeometryReader { geo in
                Color.clear.preference(key: pkType, value: geo.frame(in: .global))
            }
        )
        .onPreferenceChange(pkType) { newValue in
            onChange(newValue)
        }
    }
    
    func measureFrameInGlobal(onChange: @escaping (CGRect) -> Void) -> some View {
        measureFrameInGlobal(pkType: FrameInGlobalPK.self, onChange: onChange)
    }
}

private struct ExampleView: View {
    @State private var text = "Lorem Ipsum"
    @State private var measuredSize: CGSize?
    @State private var frameInGlobal: CGRect?

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                TextField("enter text", text: $text)
                    .textFieldStyle(.roundedBorder)
                
                Text(text)
                    .background(Color.yellow)
                    .measureSize { size in
                        measuredSize = size
                    }
                
                Text("Size of the yellow Text View: \n\(formattedSize(measuredSize))")
                    .multilineTextAlignment(.center)
                
                Text(text)
                    .background(Color.cyan)
                    .measureFrameInGlobal { rect in
                        frameInGlobal = rect
                    }
                
                Text("Rect of the cyan Text View in global coordinate space: \n\(formattedRect(frameInGlobal))")
                    .multilineTextAlignment(.center)
            }
            .padding()
        }
    }
    
    private func formattedSize(_ size: CGSize?) -> String {
        if let size {
            return String(format: "%.1f x %.1f", size.width, size.height)
        } else {
            return "-"
        }
    }
    
    private func formattedRect(_ rect: CGRect?) -> String {
        if let rect {
            return String(format: "origin: %.1f | %.1f\nsize: %.1f x %.1f", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)
        } else {
            return "-"
        }
    }
}

struct Size_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
