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
    PageContent(next: ElementReadingOrderPage()) {
      Group {
        Text(L10n.Gestures.text1)

        navigate
        VerticalSpace(.regular)
        interaction
        VerticalSpace(.regular)
        reading
      }
      .toAny()
    }
  }
}

private extension GesturesPage {
  var navigate: some View {
    Group {
      Title(L10n.Navigation.title)

      Group {
        Text(L10n.Gesture.swipeRight)
        SwipeRight()
          .frame(width: nil, height: 100.0)
        Comment(L10n.Gestures.SwipeRight.description)
        divider
      }

      Group {
        Text(L10n.Gesture.swipeLeft)
        SwipeLeft()
          .frame(width: nil, height: 100.0)
        Comment(L10n.Gestures.SwipeLeft.description)
        divider
      }

      Group {
        Text(L10n.Gesture.twoFingersSwipeUp)
        TwoFingerSwipeUp()
          .frame(width: nil, height: 100.0)
        Comment(L10n.Gestures.TwoFingersSwipeUp.description)
        divider
      }

      Group {
        Text(L10n.Gesture.twoFingersSwipeDown)
        TwoFingerSwipeDown()
          .frame(width: nil, height: 100.0)
        Comment(L10n.Gestures.TwoFingersSwipeDown.description)
        divider
      }

      Group {
        Text(L10n.Gesture.threeFingersSwipeUp)
        ThreeFingerSwipeUp()
          .frame(width: nil, height: 100.0)
        Comment(L10n.Gestures.ThreeFingersSwipeUp.description)
        divider
      }

      Group {
        Text(L10n.Gesture.threeFingersSwipeDown)
        ThreeFingerSwipeDown()
          .frame(width: nil, height: 100.0)
        Comment(L10n.Gestures.ThreeFingersSwipeDown.description)
        divider
      }
    }
  }

  var interaction: some View {
    Group {
      Title(L10n.interactrion)

      Group {
        Text(L10n.Gesture.singleTap)
        SingleTap()
          .frame(width: nil, height: 100.0)
        Comment(L10n.Gestures.SingleTap.description)
        divider
      }

      Group {
        Text(L10n.Gesture.doubleTap)
        DoubleTap()
          .frame(width: nil, height: 100.0)
        Comment(L10n.Gestures.DoubleTap.description)
        divider
      }

      Group {
        Text(L10n.Gesture.tripleTap)
        TripleTap()
          .frame(width: nil, height: 100.0)
        Comment(L10n.Gestures.TripleTap.description)
        divider
      }

      Group {
        Text(L10n.Gesture.twoFingersDoubleTap)
        TwoFingerDoubleTap()
        Comment(L10n.Gestures.TwoFingersDoubleTap.description)
        divider
      }
    }
  }

  var reading: some View {
    Group {
      Title(L10n.Gestures.reading)

      Group {
        Text(L10n.Gesture.twoFingersSingleTap)
        TwoFingerSingleTap()
          .frame(width: nil, height: 100.0)
        Comment(L10n.Gestures.TwoFingersSingleTap.description)
        divider
      }

      Group {
        Text(L10n.Gesture.threeFingersSingleTap)
        ThreeFingerSingleTap()
          .frame(width: nil, height: 100.0)
        Comment(L10n.Gestures.ThreeFingersSingleTap.description)
        divider
      }

      Group {
        Text(L10n.Gesture.threeFingersDoubleTap)
        ThreeFingerDoubleTap()
          .frame(width: nil, height: 100.0)
        Comment(L10n.Gestures.ThreeFingersDoubleTap.description)
        divider
      }

      Group {
        Text(L10n.Gesture.threeFingersTripleTap)
        ThreeFingerTripleTap()
          .frame(width: nil, height: 100.0)
        Comment(L10n.Gestures.ThreeFingersTripleTap.description)
        divider
      }

    }
  }

  var helper: some View {
    Group {
      Title(L10n.Gestures.helper)

      Group {
        Text(L10n.Gesture.fourFingersDoubleTap)
        FourFingerDoubleTap()
          .frame(width: nil, height: 100.0)
        Comment(L10n.Gestures.FourFingersDoubleTap.description)
        divider
      }
    }
  }

  var divider: some View {
    Rectangle()
      .foregroundColor(Color.secondaryBackground)
      .frame(height: 1.0)
      .padding(.vertical)
      .accessibilityHidden(true)
  }
}
