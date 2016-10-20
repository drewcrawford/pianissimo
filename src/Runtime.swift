/*
Copyright 2016 Drew Crawford

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

import Dispatch

private var _registeredValues: [String: Any] = [:]
private let queue = DispatchQueue(label: "pianissimo.Lock")

extension pianissimo {

    internal static func _register(_ type: Any, name: String) {
      queue.sync {
        _registeredValues[name] = type
      }
    }

    ///Register an instance with the dynamic runtime
    ///- parameter name: A name that uniquely identifies this instance.  It is recommended to namespace names to avoid collisions.
    ///
    ///
    public static func register(_ type: Any, name: String) {
      let _ = setupOnce
      _register(type, name: name)
    }

    ///All types registered with the dynamic runtime, keyed by name
    public static var registeredTypes: [String: Any] {
      let _ = setupOnce
      var t: [String:Any]! = [:]
      queue.sync {
        t = _registeredValues
      }
      return t
    }

    public static func types(respondingTo selector: Selector) -> [Callable] {
      return _registeredValues.values.flatMap{$0 as? Callable}.filter{$0.selectors.filter{$0 == selector}.count > 0}
    }
}