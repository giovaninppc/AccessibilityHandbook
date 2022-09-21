//
//  DifferentiateWithColorsPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct DifferentiateWithColorsPage: View, Page {
  var title: String = "Differentiate with colors"

  var body: some View {
    PageContent(next: InvertColorsPage()) {
      Group {

      }
      .toAny()
    }
  }
}
