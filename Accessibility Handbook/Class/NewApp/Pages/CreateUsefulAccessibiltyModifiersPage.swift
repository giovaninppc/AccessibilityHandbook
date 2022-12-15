//
//  CreateAFontFile.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 11/12/22.
//

import SwiftUI

struct CreatingAccessibilityModifiersPage: View, Page {
  let title: String = L10n.CreateAccessibilityModifiers.title

  @State private var counter: Int = 0
  @State private var counter2: Int = 0
  @State private var counter3: Int = 0

  private var images: [String] = [
    Asset.starryNight.name,
    Asset.sunflower.name,
    Asset.vanGogh.name
  ]

  var body: some View {
    PageContent(next: nil, deeplink: deeplink) {
      Group {
        intro
        reusingAccessibility
        reusableModifiers
      }
      .toAny()
    }
  }
}

private extension CreatingAccessibilityModifiersPage {
  @ViewBuilder
  var intro: some View {
    Text(L10n.CreateAccessibilityModifiers.text1)
    Comment(L10n.CreateAccessibilityModifiers.comment1)
    Text(L10n.CreateAccessibilityModifiers.text2)
  }

  @ViewBuilder
  var reusingAccessibility: some View {
    Title(L10n.CreateAccessibilityModifiers.ReusingAccessibility.title)
    Text(L10n.CreateAccessibilityModifiers.ReusingAccessibility.text1)
    singleCounter
    adjustableLinks
    Text(L10n.CreateAccessibilityModifiers.ReusingAccessibility.text2)
    Text(L10n.CreateAccessibilityModifiers.ReusingAccessibility.text3)
    Centered {
      carouselCell(image: Asset.starryNight.swiftUIImage, counter: $counter2)
        .toAny()
    }
    Text(L10n.CreateAccessibilityModifiers.ReusingAccessibility.text4)
    Text(L10n.CreateAccessibilityModifiers.ReusingAccessibility.text5)
    Text(L10n.CreateAccessibilityModifiers.ReusingAccessibility.text6)
  }

  @ViewBuilder
  var reusableModifiers: some View {
    Title(L10n.CreateAccessibilityModifiers.ReusableModifiers.title)
    Text(L10n.CreateAccessibilityModifiers.ReusableModifiers.text1)
    Code.swiftUI("""
    struct AdjustableModifier: ViewModifier {
      @Binding var value: Int

      func body(content: Content) -> some View {
        content
          .accessibilityElement(children: .combine)
          .accessibilityValue("\\ (value)")
          .accessibilityAdjustableAction { direction in
            switch direction {
            case .decrement:
              value -= 1
            case .increment:
              value += 1
            @unknown default:
              break
            }
          }
      }
    }
    """)
    Text(L10n.CreateAccessibilityModifiers.ReusableModifiers.text2)
    Code.swiftUI("""
    extension View {
      func adjustable(value: Binding<Int>) -> some View {
        modifier(AdjustableModifier(value: value))
      }
    }
    """)
    Text(L10n.CreateAccessibilityModifiers.ReusableModifiers.text3)
    carousel
  }

  @ViewBuilder
  var singleCounter: some View {
    Centered {
      AdjustableCounter(value: $counter)
        .toAny()
    }
  }

  @ViewBuilder
  var adjustableLinks: some View {
    Divider()
    InternalLink(deeplink: AdjustablePage().deeplink, title: L10n.Adjustable.title)
    InternalLink(deeplink: AccessibilityValuePage().deeplink, title: L10n.AccValue.title)
    Divider()
  }

  @ViewBuilder
  var carousel: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack {
        ForEach(images, id: \.self) { name in
          carouselCell(image: Image(name), counter: $counter3)
        }
      }
    }
  }

  @ViewBuilder
  func carouselCell(image: Image, title: String = "Lorem Ipsum", description: String = "Lorem ipsum sit amet", counter: Binding<Int>) -> some View {
    VStack(alignment: .leading, spacing: .small) {
      image
        .resizable()
        .aspectRatio(1.5, contentMode: .fill)
        .clipped()
        .accessibilityHidden(true)
        .frame(maxWidth: 200.0)
      Title(title)
      Text(description)
      VerticalSpace(.small)
      AdjustableCounter(value: counter)
        .toAny()
    }
    .frame(maxWidth: 200.0, maxHeight: 250.0)
    .padding()
    .background {
      RoundedRectangle(cornerRadius: 8.0)
        .foregroundColor(.secondaryBackground)
    }
    .adjustable(value: counter)
  }
}
