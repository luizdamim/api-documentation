List mandates
=============
.. api-name:: Mandates API
   :version: 1

.. warning:: The v1 API has been deprecated and will be shut down 31 December 2024.

             The documentation for listing mandates in the new v2 API can be found
             :doc:`here </reference/v2/mandates-api/list-mandates>`. For more information on the v2 API, refer to our
             :doc:`v2 migration guide </payments/migrating-v1-to-v2>`.

.. endpoint::
   :method: GET
   :url: https://api.mollie.com/v1/customers/*customerId*/mandates

.. authentication::
   :api_keys: true
   :organization_access_tokens: false
   :oauth: true

Retrieve all mandates of a customer.

Parameters
----------
Replace ``customerId`` in the endpoint URL by the customer's ID, for example ``cst_8wmqcHMN4U``.

.. parameter:: offset
   :type: integer
   :condition: optional

   The number of mandates to skip.

.. parameter:: count
   :type: integer
   :condition: optional

   The number of mandates to return (with a maximum of 250).

Access token parameters
^^^^^^^^^^^^^^^^^^^^^^^
If you are using :doc:`organization access tokens </overview/authentication>` or are creating an
:doc:`OAuth app </connect/overview>`, the ``testmode`` query string parameter is also available.

.. parameter:: testmode
   :type: boolean
   :condition: optional
   :collapse: true

   Set this to true to only retrieve test mode mandates.

Response
--------
``200`` ``application/json``

.. parameter:: totalCount
   :type: integer

   The total number of mandates available.

.. parameter:: offset
   :type: integer

   The number of skipped mandates as requested.

.. parameter:: count
   :type: integer

   The number of mandates found in ``data``, which is either the requested number (with a maximum of 250) or the default
   number.

.. parameter:: data
   :type: array

   An array of mandate objects as described in :doc:`Get mandate </reference/v1/mandates-api/get-mandate>`.

.. parameter:: links
   :type: object

   Links to help navigate through the lists of mandates, based on the given offset.

   .. parameter:: previous
      :type: string

      The previous set of mandates, if available.

   .. parameter:: next
      :type: string

      The next set of mandates, if available.

   .. parameter:: first
      :type: string

      The first set of mandates, if available.

   .. parameter:: last
      :type: string

      The last set of mandates, if available.

Example
-------

Request
^^^^^^^
.. code-block:: bash
   :linenos:

   curl -X GET https://api.mollie.com/v1/customers/cst_8wmqcHMN4U/mandates \
       -H "Authorization: Bearer test_dHar4XY7LxsDOtmnkVtjNVWXLSlXsM"

Response
^^^^^^^^

.. code-block:: none
   :linenos:

   HTTP/1.1 200 OK
   Content-Type: application/json

   {
       "totalCount": 2,
       "offset": 0,
       "count": 2,
       "data": [
           {
               "resource": "mandate",
               "id": "mdt_pO2m5jVgMa",
               "mode": "test",
               "status": "valid",
               "method": "directdebit",
               "customerId": "cst_8wmqcHMN4U",
               "details": {
                   "consumerName": "Hr E G H K\u00fcppers en\/of MW M.J. K\u00fcppers-Veeneman",
                   "consumerAccount": "NL53INGB0618365937",
                   "consumerBic": "INGBNL2A"
               },
               "createdDatetime": "2016-04-13T11:32:38.0Z"
           },
           {
               "resource": "mandate",
               "id": "mdt_qtUgejVgMN",
               "status": "valid",
               "method": "creditcard",
               "customerId": "cst_8wmqcHMN4U",
               "details": {
                   "cardHolder": "John Doe",
                   "cardNumber": "1234",
                   "cardLabel": "Mastercard",
                   "cardFingerprint": "fHB3CCKx9REkz8fPplT8N4nq",
                   "cardExpiryDate": "2016-03-31"
               },
               "createdDatetime": "2016-04-13T11:32:38.0Z"
           }
       ]
   }
