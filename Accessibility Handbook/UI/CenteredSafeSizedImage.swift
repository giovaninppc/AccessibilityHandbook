//
//  CenteredSafeSizedImage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 15/12/22.
//

import SwiftUI

struct CenterSafesizedImage: View {
  let image: Image
  let description: String?

  init(image: Image, description: String? = nil) {
    self.image = image
    self.description = description
  }

  var body: some View {
    VStack(alignment: .center, spacing: .regular) {
      image
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(maxWidth: 350.0)
        .accessibilityHidden(true)
      if let text = description {
        Comment(text)
          .multilineTextAlignment(.center)
      }
    }
    .accessibilityElement(children: .combine)
  }
}
