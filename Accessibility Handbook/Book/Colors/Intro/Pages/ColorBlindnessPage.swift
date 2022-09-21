//
//  ColorBlindness.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct ColorBlindnessPage: View, Page {
  var title: String = "Color Blindness"

  var body: some View {
    PageContent(next: ConstrastPage()) {
      Group {

      }
      .toAny()
    }
  }
}
