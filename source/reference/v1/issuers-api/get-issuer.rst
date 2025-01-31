Get issuer
==========
.. api-name:: Issuers API
   :version: 1

.. warning:: The v1 API has been deprecated and will be shut down 31 December 2024.

             The new v2 API no longer supports retrieving issuers separately. Instead, issuers can be retrieved by using
             the ``issuers`` include on the Methods API. Documentation for the Methods API v2 can be found
             :doc:`here </reference/v2/methods-api/list-methods>`. For more information on the v2 API, refer to our
             :doc:`v2 migration guide </payments/migrating-v1-to-v2>`.

.. endpoint::
   :method: GET
   :url: https://api.mollie.com/v1/issuers/*id*

.. authentication::
   :api_keys: true
   :organization_access_tokens: false
   :oauth: true

Retrieve a payment method issuer by its issuer identifier.

The Issuers API only supports iDEAL.

Parameters
----------
Replace ``id`` in the endpoint URL by the issuer's ID, for example ``ideal_ABNANL2A``.

Access token parameters
^^^^^^^^^^^^^^^^^^^^^^^
If you are using :doc:`organization access tokens </overview/authentication>` or are creating an
:doc:`OAuth app </connect/overview>`, the ``testmode`` query string parameter is also available.

.. parameter:: testmode
   :type: boolean
   :condition: optional
   :collapse: true

   Set this to true to only retrieve the issuer if it is available in test mode.

Response
--------
``200`` ``application/json``

.. parameter:: resource
   :type: string

   Indicates the response contains an issuer object. Will always contain ``issuer`` for this endpoint.

.. parameter:: id
   :type: string

   The identifier uniquely referring to this issuer. When supplying this ID as the ``issuer`` parameter during
   :doc:`payment creation </reference/v1/payments-api/create-payment>`, the issuer selection screen is skipped.

.. parameter:: name
   :type: string

   The full name of the issuer, for example 'ABN AMRO'.

.. parameter:: method
   :type: string

   The :doc:`payment method </reference/v1/methods-api/list-methods>` this issuer belongs to.

   Possible values: ``ideal``

.. parameter:: image
   :type: object

   URLs of images representing the payment method issuer.

   .. parameter:: normal
      :type: string

      The URL for an issuer icon of 55x37 pixels.

   .. parameter:: bigger
      :type: string

      The URL for an issuer icon of 110x74 pixels.

Example
-------

Request
^^^^^^^
.. code-block:: bash
   :linenos:

   curl -X GET https://api.mollie.com/v1/issuers/ideal_ABNANL2A \
       -H "Authorization: Bearer test_dHar4XY7LxsDOtmnkVtjNVWXLSlXsM"

Response
^^^^^^^^
.. code-block:: none
   :linenos:

   HTTP/1.1 200 OK
   Content-Type: application/json

   {
       "resource": "issuer",
       "id": "ideal_ABNANL2A",
       "name": "ABN AMRO",
       "method": "ideal",
       "image": {
           "normal": "https://www.mollie.com/images/checkout/v2/ideal-issuer-icons/ABNANL2A.png",
           "bigger": "https://www.mollie.com/images/checkout/v2/ideal-issuer-icons/ABNANL2A%402x.png"
       }
   }
