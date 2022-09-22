//
//  NotificationsSection.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import Foundation

struct NotificationsSection: Section {
  let title: String = "Accessibility Notifications"
  let pages: [Page] = [
    AnnouncementPage(),
    NotifyScreenChangesPage(),
    ChangeCursorPositionPage()
  ]
}
