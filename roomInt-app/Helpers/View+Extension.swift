//
//  View+Extension.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 27/12/21.
//

import SwiftUI

extension View {
    func endEditing(_ force: Bool) {
        UIApplication.shared.windows.forEach { $0.endEditing(force) }
    }
}
