//
//  LastSeenVersion.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 30/10/22.
//

import Foundation

enum VersionKeys: String, StorageKey {
  case lastSeenVersion
}

enum VersionStates {
  @Stored(key: VersionKeys.lastSeenVersion, default: "1.0.0")
  static var lastSeenVersion: String

  static func shouldDisplayWhatsNew() -> Bool {
    guard let currentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else { return false }
    if currentVersion != lastSeenVersion {
      lastSeenVersion = currentVersion
      return true
    }
    return false
  }
}
