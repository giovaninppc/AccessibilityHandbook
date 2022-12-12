//
//  HandleAllTheViewActions.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct HandleAllTheViewActionsPage: View, Page {
  let title: String = "HandleAllTheViewActions"

  var body: some View {
    PageContent(next: nil, deeplink: deeplink) {
      Group {
      }
      .toAny()
    }
  }
}
