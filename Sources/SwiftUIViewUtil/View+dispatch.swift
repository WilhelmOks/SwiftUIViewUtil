//
//  View+dispatch.swift
//  
//
//  Created by Wilhelm Oks on 29.01.24.
//

import SwiftUI

public extension View {
    func dispatchOnMain(afterDelay delay: TimeInterval? = nil, execute work: @escaping () -> Void) {
        if let delay = delay {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: work)
        } else {
            DispatchQueue.main.async(execute: work)
        }
    }
}
