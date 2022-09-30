//
//  AnnouncementPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct AnnouncementPage: View, Page {
  let title: String = L10n.Announcement.title

  private let codeUIKit: String = """
  UIAccessibility.post(
    .announcement,
    argument: "\(L10n.Announcement.textToBeRead)"
  )
  """

  private let link: String = """
  https://developer.apple.com/documentation/uikit/uiaccessibility/notification/1620176-announcement
  """

  @State private var currentValue: Int = 0

  private var secretDescriptions: String {
    switch currentValue {
    case let value where value < 0:
      return L10n.Announcement.Notifications.negative
    case 0:
      return .empty
    case 1...5:
      return L10n.Announcement.Notifications.small
    case 6...10:
      return L10n.Announcement.Notifications.medium
    case 11...20:
      return L10n.Announcement.Notifications.large
    case 21...25:
      return L10n.Announcement.Notifications.huge
    default:
      return L10n.Announcement.Notifications.final
    }
  }

  var body: some View {
    PageContent(next: NotifyScreenChangesPage()) {
      Group {
        Text(L10n.Announcement.text1)
        Text(L10n.Announcement.text2)
        Text(L10n.Announcement.text3)
        Comment(L10n.Announcement.comment1)
        example
        Comment(L10n.Announcement.comment2)
        Code.uikit(codeUIKit)
        DocButton(link: link, title: title)
      }
      .toAny()
    }
    .onChange(of: secretDescriptions) { newValue in
      UIAccessibility.post(notification: .announcement, argument: newValue)
    }
  }

  private var example: some View {
    Group {
      VerticalSpace(.regular)
      HStack {
        Spacer()
        Button {
          currentValue -= 1
        } label: {
          Icon.minus
            .resizable()
            .frame(width: 30.0, height: 30.0)
        }
        .accessibilityHidden(true)

        HorizontalSpace(.regular)

        Text("\(currentValue)")
          .font(.title.bold())

        HorizontalSpace(.regular)

        Button {
          currentValue += 1
        } label: {
          Icon.plus
            .resizable()
            .frame(width: 30.0, height: 30.0)
        }
        .accessibilityHidden(true)
        Spacer()
      }
      .accessibilityElement(children: .combine)
      .accessibilityValue("\(currentValue)")
      .accessibilityAdjustableAction { direction in
        switch direction {
        case .decrement:
          currentValue -= 1
        case .increment:
          currentValue += 1
        @unknown default:
          break
        }
      }

      VerticalSpace(.regular)
      Text(secretDescriptions)
        .font(.callout.bold())
      VerticalSpace(.regular)
    }
  }
}
