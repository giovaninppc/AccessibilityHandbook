//
//  ReduceMotionPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 03/10/22.
//

import SwiftUI

struct ReduceMotionPage: View, Page {
  let title: String = L10n.ReduceMotion.title

  @State private var opened: Bool = false
  @State private var flipped: Bool = false
  @Environment(\.accessibilityReduceMotion) var accessibilityReduceMotion

  var body: some View {
    PageContent(next: PrefferCrossFadePage()) {
      Group {
        intro
        code
        disclaimer
        VerticalSpace(.small)
        example
        VerticalSpace(.large)
        doc
      }
      .toAny()
    }
  }
}

private extension ReduceMotionPage {
  var intro: some View {
    Group {
      Text(L10n.ReduceMotion.Intro.text1)
      Text(L10n.ReduceMotion.Intro.text2)
      Text(L10n.ReduceMotion.Intro.text3)
    }
    .toAny()
  }

  var code: some View {
    Group {
      Code.uikit(
        """
        let finalState: () -> Void = {
          // Make changes for animation
        }
        if UIAccessibility.accessibilityReduceMotion {
          UIView.animate(
            animations: finalState
          )
        } else {
          finalState()
        }
        """
      )
      Code.swiftUI(
        """
        @Environment(\\.accessibilityReduceMotion)
        var accessibilityReduceMotion

        ...

        myView
          .animation(
          accessibilityReduceMotion
          ? .none
          : .default,
          value: shouldAnimate
        )
        """
      )
    }
  }

  var disclaimer: some View {
    Group {
      Text(L10n.ReduceMotion.Disclaimer.text1)
      Comment(L10n.ReduceMotion.Disclaimer.comment1)
      Text(L10n.ReduceMotion.Disclaimer.text2)
      ExternalLink(link: UIApplication.openSettingsURLString, title: L10n.openSettings)
    }
  }

  var example: some View {
    Group {
      Title(L10n.examples)
      simpleAppearance
      Divider()
      cardFlip
    }
  }

  var simpleAppearance: some View {
    Group {
      Centered {
        VStack(spacing: .regular) {
          Button {
            if !accessibilityReduceMotion {
              withAnimation {
                opened = !opened
              }
            } else {
              opened = !opened
            }
          } label: {
            Text(L10n.ReduceMotion.SimpleAppearance.text)
          }
          if opened {
            HStack {
              Icon.pencil
                .aspectRatio(contentMode: .fit)
              Icon.trash
                .aspectRatio(contentMode: .fit)
              Icon.gameController
                .aspectRatio(contentMode: .fit)
            }
            .foregroundColor(.accentColor)
            .accessibilityHidden(true)
          }
        }
        .toAny()
      }
      VerticalSpace(.regular)
      Comment(L10n.ReduceMotion.simpleAppearance)
    }
  }

  var cardFlip: some View {
    Group {
      Centered {
        Flip(flipped: $flipped) {
          frontContent
          .toAny()
        } back: {
          backContent
          .toAny()
        }
        .toAny()
      }
      Comment(L10n.ReduceMotion.cardFlip)
      Comment(L10n.ReduceMotion.cardFlip2)
      InternalLink(page: CustomActionsPage().page, title: L10n.CustomActions.title)
      Code.swiftUI(
        """
        @Environment(\\.accessibilityReduceMotion)
        private var accessibilityReduceMotion

        @Binding
        var flipped: Bool

        ...

        ZStack {
          frontView
            .opacity(flipped ? 0.0 : 1.0)
            .rotation3DEffect(
              flipped
              ? .radians(-.pi)
              : .zero,
              axis: (x: 0.0, y: 1.0, z: 0.0)
            )
          backView
            .opacity(flipped ? 1.0 : 0.0)
            .rotation3DEffect(
              flipped
              ? .zero
              : .radians(.pi),
              axis: (x: 0.0, y: 1.0, z: 0.0)
            )
        }
        .animation(
          accessibilityReduceMotion
          ? .none
          : .easeInOut.speed(0.5),
          value: flipped
        )
        .onTapGesture {
          self.flipped.toggle()
        }
        """
      )
    }
  }

  var frontContent: some View {
    VStack(alignment: .center, spacing: .regular) {
      Text(L10n.CustomActions.creditCard)
        .font(.title.bold())
      Text("**** **** **** 1234")
      Comment(L10n.tapToChange)
    }
    .padding()
    .frame(minWidth: 200.0, minHeight: 150.0)
    .background {
      RoundedRectangle(cornerRadius: 8.0)
        .foregroundColor(.secondaryBackground)
    }
    .accessibilityLabel(L10n.CustomActions.accessible)
  }

  var backContent: some View {
    VStack(alignment: .leading, spacing: .regular) {
      (Text(Icon.pencil) + Text(String.space) + Text(L10n.edit))
      (Text(Icon.trash) + Text(String.space) + Text(L10n.delete))
      (Text(Icon.book) + Text(String.space) + Text(L10n.book))
    }
    .padding()
    .frame(minWidth: 200.0, minHeight: 150.0)
    .foregroundColor(.accentColor)
    .background {
      RoundedRectangle(cornerRadius: 8.0)
        .foregroundColor(.secondaryBackground)
    }
  }

  var doc: some View {
    DocButton(link: "https://developer.apple.com/documentation/swiftui/environmentvalues/accessibilityreducemotion", title: title)
  }
}
