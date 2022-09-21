//
//  AdjustablePage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct AdjustablePage: View, Page {
  var title: String = "Adjustable content"

  var body: some View {
    PageContent(next: CustomActionsPage()) {
      Group {

      }
      .toAny()
    }
  }
}
