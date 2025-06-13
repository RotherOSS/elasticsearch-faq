.. image:: ../images/otobo-logo.png
   :align: center

.. toctree::
    :maxdepth: 2
    :caption: Contents

Overview
========
Summary
-------
This package enhances the OTOBO FAQ Package enhanced with Elasticsearch indexing and searching capabilities.

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
Open the Package Manager module from the Administration group in the Agent Interface. Select the package named *ITSMConfigItemMultitenancy* from the Online Repository. Click the associated  *Install* link on that line and respond affirmatively to any confirmation questions that may follow.

Execute the console command *Maint::Elasticsearch::Migration --target f*

Custom Configuration and Advanced Features
------------------------------------------
Through the *Elasticsearch::QuickSearchShow###FAQ* system configuration setting, the QuickSearch frontend feature's table containing the Elasticsearch results can be adjusted in terms of fields, column titles, and the maximum number of items displayed.

Configuration Reference
-----------------------
Core::Elasticsearch::Settings
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Elasticsearch::ConfigItemStoreFields
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Fields stored in the configuration item index which are used for other things besides fulltext searches. For the complete functionality all fields are mandatory.

Core::Event::ITSMConfigItem
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

ITSMConfigItem::EventModulePost###100-History
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Config item event module that enables logging to history in the agent interface.

Core::GeneralCatalog
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

ITSMConfigItemManagementGroup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Management group that exempts from any config item level group restrictions.

GeneralCatalogPreferences###ConfigitemGroup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Mode for config item level group restrictions.

Frontend::Admin
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Events###ITSMConfigItem
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
List of all Package events to be displayed in the GUI.


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
