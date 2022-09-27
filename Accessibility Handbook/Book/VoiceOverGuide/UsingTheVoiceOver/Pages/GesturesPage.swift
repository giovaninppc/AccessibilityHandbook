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

        swipeRight
        swipeLeft
        swipeUp
        swipeDown

        singleTap
        doubleTap
        tripleTap
      }
      .toAny()
    }
  }
}

private extension GesturesPage {
  var swipeRight: some View {
    Group {
      Title(L10n.Gesture.swipeRight)
      SwipeRight()
        .frame(width: nil, height: 100.0)
      Comment(L10n.Gestures.SwipeRight.description)
    }
  }

  var swipeLeft: some View {
    Group {
      Title(L10n.Gesture.swipeLeft)
      SwipeLeft()
        .frame(width: nil, height: 100.0)
      Comment(L10n.Gestures.SwipeLeft.description)
    }
  }

  var swipeUp: some View {
    Group {
      Title(L10n.Gesture.swipeUp)
      SwipeUp()
        .frame(width: nil, height: 100.0)
      Comment(L10n.Gestures.SwipeUp.description)
    }
  }

  var swipeDown: some View {
    Group {
      Title(L10n.Gesture.swipeDown)
      SwipeDown()
        .frame(width: nil, height: 100.0)
      Comment(L10n.Gestures.SwipeDown.description)
    }
  }

  var singleTap: some View {
    Group {
      Title(L10n.Gesture.singleTap)
      SingleTap()
        .frame(width: nil, height: 100.0)
      Comment(L10n.Gestures.SingleTap.description)
    }
  }

  var doubleTap: some View {
    Group {
      Title(L10n.Gesture.doubleTap)
      DoubleTap()
        .frame(width: nil, height: 100.0)
      Comment(L10n.Gestures.DoubleTap.description)
    }
  }

  var tripleTap: some View {
    Group {
      Title(L10n.Gesture.tripleTap)
      TripleTap()
        .frame(width: nil, height: 100.0)
      Comment(L10n.Gestures.TripleTap.description)
    }
  }
}
