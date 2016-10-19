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

internal final class LegalTextWriter: StaticCallable {

    static var selectors: [Selector] { return [Selectors.legalText] }
    static func _call(_ selector: Selector, input: Any?) -> Any? {
        if selector == Selectors.legalText {
            return "DynamicRuntime\n© 2016 Drew Crawford.\nhttps://code.sealedabstract.com/drewcrawford/DynamicRuntime"
        }
        return nil
    }
}

private func _setupOnce() {
    DynamicRuntime._register(LegalTextWriter.self)
}

let setupOnce: Void = _setupOnce()

extension DynamicRuntime {
    public static var legalTexts: [String] {
        return typesRespondingTo(staticSelector: Selectors.legalText).map{$0.call(Selectors.legalText, input: nil) as String?}.flatMap{$0}
    }
}