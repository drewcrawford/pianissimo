.. pianissimo documentation master file, created by
   sphinx-quickstart on Wed Oct 19 16:05:10 2016.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

pianissimo
======================================

pianissimo is a userspace dynamic runtime for Swift programs.  It allows runtime introspection, dispatch-by-string, weak dependencies, and other dynamic programming patterns in the Swift programming language.

`Dynamic swift <http://mjtsai.com/blog/2016/05/21/dynamic-swift-2/>`_ is a topic of some debate in the Swift community.  `It's coming <https://lists.swift.org/pipermail/swift-evolution/Week-of-Mon-20160926/027337.html>`_ but it's not quite there yet.

However, there is nobody to stop us from implementing *something* right now.  pianissimo is a dynamic runtime implementation in userspace; it works on top of ordinary Swift and sits in parallel to whatever dynamic features eventually make it into the language.  Ideally, some day Swift will have all this built in and then I will deprecate it.


Features
++++++++++++++++++++

pianissimo supports:

* Dynamic, namespaced lookup of all registered types.  (Swift ``_typeByName`` only supports reference types)
* Dispatch-by-string

Limitations
+++++++++++++

A design limitation of pianissimo is that it only interacts with values that have :static_method:`registered <pianissimo.register(_:name:)>`.

Contents:

.. toctree::
   :maxdepth: 2

   registration
   dispatch
   legaltext


Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
