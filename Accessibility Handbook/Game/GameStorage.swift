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
  case impostor
  case invisibility
  case impostor2
  case theMagicPuzzle
  case secretActions
  case fillTheCup
  case aColorfulMessage
}

enum GameStates {
  @Stored(key: GameKeys.whereIsMyContent, default: false)
  static var whereIsMyContentCompleted: Bool

  @Stored(key: GameKeys.findThePassword, default: false)
  static var findThePasswordCompleted: Bool

  @Stored(key: GameKeys.bePatient, default: false)
  static var bePatientCompleted: Bool

  @Stored(key: GameKeys.impostor, default: false)
  static var impostorCompleted: Bool

  @Stored(key: GameKeys.invisibility, default: false)
  static var invisibilityCompleted: Bool

  @Stored(key: GameKeys.impostor2, default: false)
  static var impostor2Completed: Bool

  @Stored(key: GameKeys.theMagicPuzzle, default: false)
  static var theMagicPuzzleCompleted: Bool

  @Stored(key: GameKeys.secretActions, default: false)
  static var secretActionsCompleted: Bool

  @Stored(key: GameKeys.fillTheCup, default: false)
  static var fillTheCupCompleted: Bool

  @Stored(key: GameKeys.aColorfulMessage, default: false)
  static var aColorfulMessageCompleted: Bool
}
