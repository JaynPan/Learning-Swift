//
//  WeatherButton.swift
//  test
//
//  Created by 潘傑恩 on 2023/6/10.
//

import Foundation
import SwiftUI

struct WeatherButton: View {
    var title: String
    @Binding var isNight: Bool

    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(isNight ? .black:.white)
            .foregroundColor(isNight ? .white : .gray)
            .cornerRadius(32)
    }
}
