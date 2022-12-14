//
//  HomeSections.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import Foundation

struct VoiceOverGuideSections: SectionProvider {
  let title: String = L10n.voiceOverGuide
  let sections: [Section] = [
    UsingTheVoiceOverSection(),
    AccessibilityPropertiesSection(),
    InteractionSection(),
    AccessibilityTraitsSection(),
    ContentHierarchySectionSection(),
    NotificationsSection()
  ]
}
