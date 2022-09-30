//
//  Storable.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import Foundation

protocol StorageKey {
  var key: String { get }
}

extension StorageKey where Self: RawRepresentable, RawValue == String {
  var key: String { rawValue }
}

extension UserDefaults {
  func value(for key: StorageKey) -> Any? {
    value(forKey: key.key)
  }

  func setValue(_ value: Any?, for key: StorageKey) {
    setValue(value, forKey: key.key)
  }
}

@propertyWrapper
struct Stored<Value, Key: StorageKey> {
  let key: Key
  let `default`: Value

  private let container: UserDefaults = .standard

  var wrappedValue: Value {
    get { container.value(for: key) as? Value ?? self.default }
    set { container.setValue(newValue, for: key) }
  }
}
