//
//  ColorAsset+extensions.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 07/10/22.
//

import SwiftUI

extension ColorAsset {
  var swiftUIColor: SwiftUI.Color {
    SwiftUI.Color(uiColor: self.color)
  }
}
