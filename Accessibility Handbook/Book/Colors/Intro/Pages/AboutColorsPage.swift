//
//  AboutColors.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct AboutColorsPage: View, Page {
  var title: String = "About Colors"

  var body: some View {
    PageContent(next: ColorBlindnessPage()) {
      Group {
        Text("I like colors.\nBut not everybody experience them in the same way.")
        Comment("Some people don't experience them at all!")
      }
      .toAny()
    }
  }
}
