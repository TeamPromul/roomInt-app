//
//  Text+Extension.swift
//  roomInt-app
//
//  Created by Muhammad Rifki Widadi on 13/12/21.
//

import SwiftUI

extension Text {
    func textH3Bold() -> some View {
        self.foregroundColor(.white)
            .bold()
            .font(.system(size: 33))
    }

    func textH5Regular() -> some View {
        self.foregroundColor(.white)
            .font(.system(size: 18))
    }
}


