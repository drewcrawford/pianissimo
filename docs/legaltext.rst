Legal Text Management
======================

A common dynamic programming problem involves computing the :term:`legal texts<legal text>` from the libraries used in the current program.  In cases where the program is dynamically linked, the legal texts may not be known at compile time.  In cases where the program is statically linked, the management of legal texts in separate files is tedious as they are easily separated from the program.

.. glossary::
    
    legal text
        An attribution notice required to be displayed to end users due to legal or licensing requirements.  Often given in a file named NOTICE, or otherwise mandated in popular software licenses.

pianissimo ships a ready-to-use legal text registration system.  The implementation of this system is also useful for understanding how to build other dynamic systems in pianissimo.

API
+++++

.. autoextension:: pianissimo
    :members: legalTexts
    :raw-members: register(legalText: String
    :only-with-raw-members: register(legalText: String

Sample usage
-------------

.. code-block:: swift

    pianissimo.registerLegalText("pianissimo\n© 2016 Drew Crawford.\nhttps://code.sealedabstract.com/drewcrawford/pianissimo")
    print(pianissimo.legalTexts)

Implementation
+++++++++++++++

To see the complete implementation, see the `source code <https://code.sealedabstract.com/drewcrawford/pianissimo/blob/master/src/LegalText.swift>`_.

First, we create a type to respond to dynamic dispatches:

.. code-block:: swift

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

Then, we define a "once" function that registers our legal writer:

.. code-block:: swift

    private func _setupOnce() {
        pianissimo._register(LegalTextWriter(text: "pianissimo\n© 2016 Drew Crawford.\nhttps://code.sealedabstract.com/drewcrawford/pianissimo"), name: "pianissimo.LegalText")
    }

    let setupOnce: Void = _setupOnce()


This setup is then performed at the beginning of all our public API entrypoints:

.. code-block:: swift

    public func foo() {
        let _ = setupOnce
        //do foo
    }

ensuring that the legal text has been registered.  

Finally, we implement a method to look up all legal texts registered with the system:

.. code-block:: swift

    public static var legalTexts: [String] {
        return types(respondingTo: Selectors.legalText).map{try? $0.call(Selectors.legalText, input: nil) as String?}.flatMap{$0}.flatMap{$0}
    }
