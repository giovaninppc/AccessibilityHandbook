//
//  DifferentiateWithColorsPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct DifferentiateWithoutColorsPage: View, Page {
  var title: String = "Differentiate without colors"

  var body: some View {
    PageContent(next: InvertColorsPage()) {
      Group {

      }
      .toAny()
    }
  }
}
