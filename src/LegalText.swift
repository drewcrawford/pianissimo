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

private enum Selectors: String, Selector {
    case legalText = "legalText"
}

private struct LegalTextWriter: Callable {
    let text: String
    var selectors: [Selector] { return [Selectors.legalText] }
    func _call(_ selector: Selector, input: Any?) -> Any? {
        if selector == Selectors.legalText {
            return text
        }
        return nil
    }
}


private func _setupOnce() {
    pianissimo._register(LegalTextWriter(text: "pianissimo\n© 2016 Drew Crawford.\nhttps://code.sealedabstract.com/drewcrawford/pianissimo"), name: "pianissimo.LegalText")
}

let setupOnce: Void = _setupOnce()

extension pianissimo {
    ///Register the legal text
    ///- parameter name: A unique, namespaced name.  This will be used as a key for `registeredTypes`
    public static func register(legalText: String, name:String) {
        register(LegalTextWriter(text: legalText), name: name)
    }
    ///All legal texts registered with the system
    public static var legalTexts: [String] {
        let _ = setupOnce
        return types(respondingTo: Selectors.legalText).map{try? $0.call(Selectors.legalText, input: nil) as String?}.flatMap{$0}.flatMap{$0}
    }
}