//
//  VoiceOverIssues.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 15/12/22.
//

import SwiftUI

struct UngroupedElements: View, Page {
  let title: String = L10n.UngroupedElements.UngroupedElements.title

  var body: some View {
    PageContent(next: nil, deeplink: deeplink) {
      Group {
        intro
        ungroupedElements
        ungroupedSwiftUIContent
        ungroupedUIKitContent
      }
      .toAny()
    }
  }
}

private extension UngroupedElements {
  @ViewBuilder
  var intro: some View {
    Text(L10n.UngroupedElements.text1)
    Comment(L10n.UngroupedElements.text2)
  }

  @ViewBuilder
  var ungroupedElements: some View {
    Text(L10n.UngroupedElements.UngroupedElements.text1)
    Text(L10n.UngroupedElements.UngroupedElements.text2)
    Text(L10n.UngroupedElements.UngroupedElements.text3)
    Text(L10n.UngroupedElements.UngroupedElements.text4)
  }

  @ViewBuilder
  var ungroupedSwiftUIContent: some View {
    ungroupedSwiftUI
    Text(L10n.UngroupedElements.UngroupedExamples.text1)
    Text(L10n.UngroupedElements.UngroupedExamples.text2)
    Text(L10n.UngroupedElements.UngroupedExamples.text3)
    Comment(L10n.UngroupedElements.UngroupedExamples.comment1)
    Text(L10n.UngroupedElements.UngroupedExamples.text4)
    Comment(L10n.UngroupedElements.UngroupedExamples.comment2)
    ungroupedSwiftUIFixed
  }

  @ViewBuilder
  var ungroupedUIKitContent: some View {
    Text(L10n.UngroupedElements.UngroupedExamples.text5)
    ungroupedUIKit
    Text(L10n.UngroupedElements.UngroupedExamples.text6)
    ungroupedUIKitFix
  }
}

private extension UngroupedElements {
  private var ungroupedSwiftUI: some View {
    Code.swiftUI("""
    VStack {
      Text(titleContent)
        .font(.title)
      Text(descriptionContent)
        .font(.body)
    }
    .padding()
    .background {
       CommonCellBackground()
    }
    """)
  }

  private var ungroupedSwiftUIFixed: some View {
    Code.swiftUI("""
    VStack {
      Text(titleContent)
        .font(.title)
      Text(descriptionContent)
        .font(.body)
    }
    .padding()
    .background {
       CommonCellBackground()
    }
    .accessibilityElement(children: .combine)
    """)
  }

  private var ungroupedUIKit: some View {
    Code.swiftUI("""
    class Cell: UIView {
      let titleLabel = UILabel()
      let descriptionLabel = UILabel()

      func constrain() {
        // Setup Constraints
      }
    }
    """)
  }

  private var ungroupedUIKitFix: some View {
    Code.swiftUI("""
    func setupAccessibility() {
      self.isAccessibilityElement = true
      self.accessibilityLabel = [titleLabel, descriptionLabel]
        .compactMap { $0.text }.joined(",")
    }
    """)
  }
}
