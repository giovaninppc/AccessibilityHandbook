//
//  RotorExampleView.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 02/11/22.
//

import SwiftUI

extension RotorExampleView {
  enum Value: Identifiable {
    case icon(Image, String)
    case text(String)
    case notes(String)
    case link(String, String)

    var id: String {
      switch self {
      case .notes(let value), .text(let value), .link(_, let value):
        return .init(value)
      case .icon(_, let label):
        return .init(label)
      }
    }
  }
}

struct RotorExampleView: View {
  @Namespace
  private var customRotorNamespace

  @Environment(\.dismiss)
  var dismiss

  private let content: [Value] = [
    .text(L10n.RotorExample.history1),
    .icon(Asset.vanGogh.swiftUIImage, L10n.RotorExample.vanGoghImage),
    .text(L10n.RotorExample.history2),
    .notes(L10n.RotorExample.note1),
    .link(L10n.RotorExample.link1, "https://en.wikipedia.org/wiki/Impressionism"),
    .text(L10n.RotorExample.history3),
    .icon(Asset.starryNight.swiftUIImage, L10n.RotorExample.starryNight),
    .notes(L10n.RotorExample.note2),
    .link(L10n.RotorExample.link2, "https://en.wikipedia.org/wiki/The_Starry_Night"),
    .text(L10n.RotorExample.history4),
    .icon(Asset.sunflower.swiftUIImage, L10n.RotorExample.sunflower),
    .notes(L10n.RotorExample.note3),
    .link(L10n.RotorExample.link3, "https://en.wikipedia.org/wiki/Sunflowers_(Van_Gogh_series)"),
  ]

  var body: some View {
    ScrollView([.vertical], showsIndicators: false) {
      VStack(alignment: .leading, spacing: .regular) {
        closeButton
        intro
        elements
        Divider()
        VerticalSpace(.large)
      }
      .padding()
    }
    .accessibilityRotor(L10n.RotorExample.images) {
      ForEach(content) { item in
        if case .icon(_, let label) = item {
          AccessibilityRotorEntry(label, item.id, in: customRotorNamespace)
        }
      }
    }
    .accessibilityRotor(L10n.RotorExample.history) {
      ForEach(content) { item in
        if case .text(let label) = item {
          AccessibilityRotorEntry(label, item.id, in: customRotorNamespace)
        }
      }
    }
    .accessibilityRotor(L10n.RotorExample.notes) {
      ForEach(content) { item in
        if case .notes(let label) = item {
          AccessibilityRotorEntry(label, item.id, in: customRotorNamespace)
        }
      }
    }
    .accessibilityRotor(L10n.RotorExample.links) {
      ForEach(content) { item in
        if case .link(let label, _) = item {
          AccessibilityRotorEntry(label, item.id, in: customRotorNamespace)
        }
      }
    }
  }
}

private extension RotorExampleView {
  var closeButton: some View {
    HStack {
      Spacer()
      Button {
        dismiss()
      } label: {
        Icon.close
      }
      .accessibilityLabel(L10n.dismiss)
    }
  }

  @ViewBuilder
  var intro: some View {
    Title(L10n.RotorExample.title)
    Text(L10n.RotorExample.text1)
    Text(L10n.RotorExample.text2)
    Text(L10n.RotorExample.text3)
    VerticalSpace(.large)
    Divider()
  }

  @ViewBuilder
  var elements: some View {
    Title(L10n.RotorExample.vanGogh)
    ForEach(content) { item in
      Group {
        switch item {
        case .text(let text):
          Text(text)
        case .notes(let note):
          Comment(note)
        case .link(let name, let link):
          ExternalLink(link: link, title: name)
        case .icon(let image, let accLabel):
          image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .accessibilityLabel(accLabel)
            .frame(maxWidth: 300.0)
        }
      }
      .accessibilityRotorEntry(id: item.id, in: customRotorNamespace)
    }
  }
}
