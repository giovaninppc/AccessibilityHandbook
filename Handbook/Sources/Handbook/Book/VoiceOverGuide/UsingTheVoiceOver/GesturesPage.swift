//
//  Gestures.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 27/09/22.
//

import SwiftUI

struct GesturesPage: View, Page {
  let title: String = L10n.Gestures.title

  var body: some View {
    ScrollView {
      HStack {
        VStack(alignment: .leading, spacing: .regular) {
          Text(L10n.Gestures.text1)

          VerticalSpace(.regular)
          navigate
          VerticalSpace(.regular)
          interaction
          VerticalSpace(.regular)
          reading
          VerticalSpace(.regular)
          helper
        }
        .padding()
        Spacer()
      }
    }
    .navigationTitle(title)
  }
}

private extension GesturesPage {
  var navigate: some View {
    Group {
      Title(L10n.Navigation.title)
      item(
        title: L10n.Gesture.swipeRight,
        animation: SwipeRight().toAny(),
        description: L10n.Gestures.SwipeRight.description
      )
      item(
        title: L10n.Gesture.swipeLeft,
        animation: SwipeLeft().toAny(),
        description: L10n.Gestures.SwipeLeft.description
      )
      item(
        title: L10n.Gesture.twoFingersSwipeUp,
        animation: TwoFingerSwipeUp().toAny(),
        description: L10n.Gestures.TwoFingersSwipeUp.description
      )
      item(
        title: L10n.Gesture.twoFingersSwipeDown,
        animation: TwoFingerSwipeDown().toAny(),
        description: L10n.Gestures.TwoFingersSwipeDown.description
      )
      item(
        title: L10n.Gesture.threeFingersSwipeUp,
        animation: ThreeFingerSwipeUp().toAny(),
        description: L10n.Gestures.ThreeFingersSwipeUp.description
      )
      item(
        title: L10n.Gesture.threeFingersSwipeDown,
        animation: ThreeFingerSwipeDown().toAny(),
        description: L10n.Gestures.ThreeFingersSwipeDown.description
      )
      item(
        title: L10n.Gesture.dismiss,
        animation: DismissGesture().toAny(),
        description: L10n.Gestures.Dismiss.description
      )
    }
  }

  var interaction: some View {
    Group {
      Title(L10n.interactrion)

      item(
        title: L10n.Gesture.singleTap,
        animation: SingleTap().toAny(),
        description: L10n.Gestures.SingleTap.description
      )
      item(
        title: L10n.Gesture.doubleTap,
        animation: DoubleTap().toAny(),
        description: L10n.Gestures.DoubleTap.description
      )
      item(
        title: L10n.Gesture.tripleTap,
        animation: TripleTap().toAny(),
        description: L10n.Gestures.TripleTap.description
      )
      item(
        title: L10n.Gesture.twoFingersDoubleTap,
        animation: TwoFingerDoubleTap().toAny(),
        description: L10n.Gestures.TwoFingersDoubleTap.description
      )
    }
  }

  var reading: some View {
    Group {
      Title(L10n.Gestures.reading)
      item(
        title: L10n.Gesture.twoFingersSingleTap,
        animation: TwoFingerSingleTap().toAny(),
        description: L10n.Gestures.TwoFingersSingleTap.description
      )
      item(
        title: L10n.Gesture.threeFingersSingleTap,
        animation: ThreeFingerSingleTap().toAny(),
        description: L10n.Gestures.ThreeFingersSingleTap.description
      )
      item(
        title: L10n.Gesture.threeFingersDoubleTap,
        animation: ThreeFingerDoubleTap().toAny(),
        description: L10n.Gestures.ThreeFingersDoubleTap.description
      )
      item(
        title: L10n.Gesture.threeFingersTripleTap,
        animation: ThreeFingerTripleTap().toAny(),
        description: L10n.Gestures.ThreeFingersTripleTap.description
      )
    }
  }

  var helper: some View {
    Group {
      Title(L10n.Gestures.helper)
      item(
        title: L10n.Gesture.fourFingersDoubleTap,
        animation: FourFingerDoubleTap().toAny(),
        description: L10n.Gestures.FourFingersDoubleTap.description
      )
    }
  }

  var divider: some View {
    Rectangle()
      .foregroundColor(Color.secondaryBackground)
      .frame(height: 1.0)
      .padding(.vertical)
      .accessibilityHidden(true)
  }

  @ViewBuilder
  private func item(title: String, animation: AnyView, description: String) -> some View {
    Group {
      Text(title)
        .font(.body.bold())
      animation
        .frame(width: nil, height: 100.0)
      Comment(description)
        .fixedSize(horizontal: false, vertical: true)
      divider
    }
  }
}
