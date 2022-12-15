//
//  ClassWelcome.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 15/12/22.
//

import SwiftUI

enum ClassesKeys: String, StorageKey {
  case hasStartedClasses
}

struct ClassWelcome: View {
//  @Stored(key: ClassesKeys.hasStartedClasses, default: false)
  static var hasStartedClasses: Bool = false

  @State var index: Int = 0
  @Environment(\.dismiss)
  var dismiss

  private let content: [String] = [
    L10n.AccessibilityWelcome.card1,
    L10n.AccessibilityWelcome.card2,
    L10n.AccessibilityWelcome.card3,
    L10n.AccessibilityWelcome.card4
  ]

  private let images: [Image] = [
    Asset.starryNight.swiftUIImage,
    Asset.starryNight.swiftUIImage,
    Asset.starryNight.swiftUIImage,
    Asset.starryNight.swiftUIImage
  ]

  var body: some View {
    VStack {
      close
      HStack {
        back
        card
        next
      }
    }
    .onAppear {
      Self.hasStartedClasses = true
    }
  }
}

private extension ClassWelcome {
  var close: some View {
    HStack {
      Spacer()
      Button {
        dismiss()
      } label: {
        Icon.close
      }
      .padding()
      .accessibilityLabel(L10n.AccessibilityWelcome.close)
    }
  }

  var back: some View {
    Button {
      index -= 1
    } label: {
      VStack {
        Spacer()
        Icon.leftChevron
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 20.0, height: 20.0)
        Spacer()
      }
      .frame(maxHeight: .infinity)
    }
    .padding()
    .disabled(index == 0)
    .accessibilityElement(children: .combine)
    .accessibilityLabel(L10n.AccessibilityWelcome.previous)
  }

  var next: some View {
      Button {
        index += 1
      } label: {
        VStack {
          Spacer()
          Icon.rightChevron
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20.0, height: 20.0)
          Spacer()
        }
        .frame(maxHeight: .infinity)
      }
      .padding()
      .disabled(index == 3)
      .accessibilityElement(children: .combine)
      .accessibilityLabel(L10n.AccessibilityWelcome.next)
  }

  @ViewBuilder
  var card: some View {
    VStack {
      Spacer()
      images[index]
        .resizable()
        .aspectRatio(contentMode: .fit)
        .accessibilityHidden(true)
      VerticalSpace(.large)
      Text(content[index])
        .font(.headline)
        .multilineTextAlignment(.center)
      Spacer()
      indexMark
    }
    .accessibilityElement(children: .combine)
    .accessibilityAction {
      guard index < content.count - 1 else { return }
      index += 1
    }
  }

  @ViewBuilder
  var indexMark: some View {
    HStack(spacing: .large) {
      ForEach(0...(content.count - 1), id: \.self) { current in
        Circle()
          .frame(width: 5.0, height: 5.0)
          .foregroundColor(current == index ? .pink : .secondaryBackground)
      }
    }
    .padding(.bottom)
    .accessibilityElement(children: .combine)
    .accessibilityHidden(true)
  }
}
