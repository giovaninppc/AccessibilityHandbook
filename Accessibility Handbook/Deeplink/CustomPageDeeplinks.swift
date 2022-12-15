//
//  CustomPageDeeplinks.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 14/12/22.
//

import SwiftUI

enum CustomPageDeeplinks {
  static var deeplinks: [Deeplink: AnyView] {
    [
      rotorExampleDeeplink(): RotorExampleView().toAny(),
      classWelcomeDeeplink(): ClassWelcome().toAny()
    ]
  }

  static func rotorExampleDeeplink() -> Deeplink {
    baseDeeplinkScheme + "://" + "rotorExample"
  }

  static func classWelcomeDeeplink() -> Deeplink {
    baseDeeplinkScheme + "://" + "classWelcome"
  }
}
