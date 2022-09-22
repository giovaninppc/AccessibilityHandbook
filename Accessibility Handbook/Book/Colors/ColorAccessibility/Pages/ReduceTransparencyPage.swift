//
//  ReduceTransparencyPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct ReduceTransparencyPage: View, Page {
  var title: String = "Reduce Transparency"

  var body: some View {
    PageContent(next: DifferentiateWithoutColorsPage()) {
      Group {

      }
      .toAny()
    }
  }
}
