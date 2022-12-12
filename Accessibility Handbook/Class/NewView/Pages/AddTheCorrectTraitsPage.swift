//
//  AddTheCorrectTraits.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct AddTheCorrectTraitsPage: View, Page {
  let title: String = "AddTheCorrectTraits"

  var body: some View {
    PageContent(next: HandleAllTheViewActionsPage(), deeplink: deeplink) {
      Group {
      }
      .toAny()
    }
  }
}
