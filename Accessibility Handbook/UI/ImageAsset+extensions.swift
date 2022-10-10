//
//  ImageAsset.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 22/09/22.
//

import SwiftUI

extension ImageAsset {
  var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(uiImage: self.image)
  }
}
