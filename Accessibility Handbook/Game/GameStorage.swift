//
//  GameStorage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import Foundation

enum GameKeys: String, StorageKey {
  case whereIsMyContent
  case findThePassword
  case bePatient
}

enum GameStates {
  @Stored(key: GameKeys.whereIsMyContent, default: false)
  static var whereIsMyContentCompleted: Bool

  @Stored(key: GameKeys.findThePassword, default: false)
  static var findThePasswordCompleted: Bool

  @Stored(key: GameKeys.bePatient, default: false)
  static var bePatientCompleted: Bool
}
