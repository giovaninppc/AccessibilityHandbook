//
//  AllPagesProvider.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 29/10/22.
//

import Foundation

struct AllPagesProvider {
  var allPages: [Page] {
    let guideSections = VoiceOverGuideSections().sections + ColorsSection().sections
      + OthersSections().sections + DynamicFontSections().sections
    let guidePages = guideSections.map { $0.pages }.flatMap { $0 }
    let gamePages = Games.pages
    let aboutPages: [Page] = [AboutTheAppView(), CollaborationView()]
    return guidePages + gamePages + aboutPages
  }
}
