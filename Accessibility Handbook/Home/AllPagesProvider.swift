//
//  AllPagesProvider.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 29/10/22.
//

import SwiftUI

struct AllPagesProvider {
  let allPages: [Page] = {
    let guideSections = VoiceOverGuideSections().sections + ColorsSection().sections
      + OthersSections().sections + DynamicFontSections().sections
    let guidePages = guideSections.map { $0.pages }.flatMap { $0 }
    let gamePages = Games.pages
    let aboutPages: [Page] = [AboutTheAppView(), CollaborationView(), GesturesPage()]
    let classes: [Page] = ClassSections().sections.map { $0.pages }.flatMap { $0 }
    let group = guidePages + gamePages + aboutPages + classes
    return group.sorted { $0.title < $1.title }
  }()

  let pageIconDict: [String: Image] = {
    var dict: [String: Image] = [:]
    VoiceOverGuideSections().sections.map { $0.pages }.flatMap { $0 }.forEach { voiceOverPage in
      dict[voiceOverPage.id] = Icon.book
    }
    ColorsSection().sections.map { $0.pages }.flatMap { $0 }.forEach { colorPage in
      dict[colorPage.id] = Icon.paintpalete
    }
    OthersSections().sections.map { $0.pages }.flatMap { $0 }.forEach { othersPage in
      dict[othersPage.id] = Icon.circleHexagonpath
    }
    DynamicFontSections().sections.map { $0.pages }.flatMap { $0 }.forEach { dynamicFontPage in
      dict[dynamicFontPage.id] = Icon.textformat
    }
    ClassSections().sections.map { $0.pages }.flatMap { $0 }.forEach { classPage in
      dict[classPage.id] = Icon.bookshelf
    }
    Games.pages.forEach { game in
      dict[game.id] = Icon.gameController
    }
    dict[AboutTheAppView().id] = Icon.questionMarkDashed
    dict[CollaborationView().id] = Icon.textRedaction
    dict[GesturesPage().id] = Icon.raisedHands

    return dict
  }()
}
