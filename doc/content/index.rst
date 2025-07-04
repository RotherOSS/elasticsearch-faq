.. image:: ../images/otobo-logo.png
   :align: center

.. toctree::
    :maxdepth: 2
    :caption: Contents

Overview
========
Summary
-------
This package enhances the OTOBO FAQ Package with Elasticsearch capabilities.

Configuration
=============

System requirements
-------------------
Framework
^^^^^^^^^
OTOBO 11.0.x

Packages
^^^^^^^^
FAQ 11.0.6

Third-party software
^^^^^^^^^^^^^^^^^^^^
Not applicable

Basic Configuration
-------------------
Open the Package Manager module from the Administration group in the Agent Interface. Select the package named *Elasticsearch-FAQ* from the Online Repository. Click the associated  *Install* link on that line and respond affirmatively to any confirmation questions that may follow.

Execute the console command *bin/otobo.Console.pl Maint::Elasticsearch::Migration --target f*

Custom Configuration and Advanced Features
------------------------------------------
Through the *Elasticsearch::QuickSearchShow###FAQ* system configuration setting, the QuickSearch frontend feature's table containing the Elasticsearch results can be adjusted in terms of fields, column titles, and the maximum number of items displayed.

Configuration Reference
-----------------------
Core::Elasticsearch::Settings
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Elasticsearch::FAQSearchFields
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Fields of the faq index, used for the fulltext search. Fields are also stored, but are not mandatory for the overall functionality. Inclusion of attachments can be disabled by setting the entry to 0 or deleting it.

Elasticsearch::QuickSearchShow###FAQ
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Objects to search for, how many entries and which attributs to show. FAQ attributes have to explicitly be stored via Elasticsearch.

Elasticsearch::IndexSettings###FAQ
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Number of shards (NS), replicas (NR) and fields limit for the index 'faq'.

Elasticsearch::FAQStoreFields
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Fields stored in the faq index which are used for other things besides fulltext searches. For the complete functionality all fields are mandatory.

Core::Event::FAQ
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

FAQ::EventModulePost###9800-GenericInterface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Performs the configured action for each event (as an Invoker) for each configured Webservice.

Frontend::Admin
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Events###FAQ
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
List of all Package events to be displayed in the GUI.

GenericInterface::Invoker::ModuleRegistration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

GenericInterface::Invoker::Module###Elasticsearch::FAQManagement
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
GenericInterface module registration for the invoker layer.

About
=======

Contact
-------
| Rother OSS GmbH
| Email: hello@otobo.io
| Web: https://otobo.io

Version
-------
Author: |doc-vendor| / Version: |doc-version| / Date of release: |doc-datestamp|
