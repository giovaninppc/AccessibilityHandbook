//
//  NotificationsSection.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import Foundation

struct NotificationsSection: Section {
  let title: String = L10n.AccNotifications.title
  let pages: [Page] = [
    AnnouncementPage(),
    NotifyScreenChangesPage(),
    ChangeCursorPositionPage()
  ]
}
