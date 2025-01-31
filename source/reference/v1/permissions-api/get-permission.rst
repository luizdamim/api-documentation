Get permission
==============
.. api-name:: Permissions API
   :version: 1

.. warning:: The v1 API has been deprecated and will be shut down 31 December 2024.

             The documentation for retrieving permissions in the new v2 API can be found
             :doc:`here </reference/v2/permissions-api/get-permission>`. For more information on the v2 API, refer
             to our :doc:`v2 migration guide </payments/migrating-v1-to-v2>`.

.. endpoint::
   :method: GET
   :url: https://api.mollie.com/v1/permissions/*id*

.. authentication::
   :api_keys: false
   :organization_access_tokens: false
   :oauth: true

All API actions through OAuth are by default protected for privacy and/or money related reasons and therefore require
specific permissions. These permissions can be requested by apps during the OAuth authorization flow. The Permissions
resource allows the app to check whether an API action is (still) allowed by the authorization.

Parameters
----------
Replace ``id`` in the endpoint URL by the permission's ID, for example ``payments.read``. See
:doc:`Permissions </connect/permissions>` for details about the available permissions.

Response
--------
``200`` ``application/json``

.. parameter:: resource
   :type: string

   Indicates the response contains a permission object. Will always contain ``permission`` for this endpoint.

.. parameter:: id
   :type: string

   The permission's unique identifier, for example ``payments.read``. See
   :doc:`Permissions </connect/permissions>` for details about the available permissions.

   Possible values: ``apikeys.read`` ``apikeys.write`` ``customers.read`` ``customers.write`` ``mandates.read``
   ``mandates.write`` ``organizations.read`` ``organizations.write`` ``payments.read`` ``payments.write``
   ``profiles.read`` ``profiles.write`` ``refunds.read`` ``refunds.write`` ``settlements.read``

.. parameter:: description
   :type: string

   A short description of what the permission allows.

.. parameter:: warning
   :type: string

   A mandatory warning message when necessary.

.. parameter:: granted
   :type: boolean

   Whether this permission is granted to the app by the organization or not.

Example
-------

Request
^^^^^^^
.. code-block:: bash
   :linenos:

   curl -X GET https://api.mollie.com/v1/permissions/payments.read \
       -H "Authorization: Bearer access_Wwvu7egPcJLLJ9Kb7J632x8wJ2zMeJ"

Response
^^^^^^^^
.. code-block:: none
   :linenos:

   HTTP/1.1 200 OK
   Content-Type: application/json

   {
       "resource": "permission",
       "id": "payments.read",
       "description": "View your payments",
       "warning": null,
       "granted": true
   }
