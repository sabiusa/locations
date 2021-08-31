//
//  View+Extensions.swift
//  locations
//
//  Created by Saba Khutsishvili on 31.08.21.
//

import SwiftUI

extension View {
    /**
    Modify the view in a closure. This can be useful when you need to conditionally apply a modifier that is unavailable on certain platforms.

    For example, imagine this code needing to run on macOS too where `View#actionSheet()` is not available:

    ```
    struct ContentView: View {
        var body: some View {
            Text("Unicorn")
                .modify {
                    #if os(iOS)
                    $0.actionSheet(…)
                    #else
                    $0
                    #endif
                }
        }
    }
    ```
    */
    func modify<T: View>(@ViewBuilder modifier: (Self) -> T) -> T {
        modifier(self)
    }
}
