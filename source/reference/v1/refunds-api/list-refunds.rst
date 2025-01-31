List refunds
============
.. api-name:: Refunds API
   :version: 1

.. warning:: The v1 API has been deprecated and will be shut down 31 December 2024.

             The documentation for listing refunds in the new v2 API can be found
             :doc:`here </reference/v2/refunds-api/list-refunds>`. For more information on the v2 API, refer to our
             :doc:`v2 migration guide </payments/migrating-v1-to-v2>`.

.. endpoint::
   :method: GET
   :url: https://api.mollie.com/v1/refunds

.. endpoint::
   :method: GET
   :url: https://api.mollie.com/v1/payments/*paymentId*/refunds

.. authentication::
   :api_keys: true
   :organization_access_tokens: false
   :oauth: true

Retrieve all :doc:`refunds </payments/refunds>`. If the payment-specific endpoint is used, only refunds for that
specific payment are returned.

The results are paginated. See :doc:`pagination </overview/pagination>` for more information.

Parameters
----------
When using the payment-specific endpoint, replace ``paymentId`` in the endpoint URL by the payment's ID, for example
``tr_7UhSN1zuXS``.

.. parameter:: offset
   :type: integer
   :condition: optional

   The number of refunds to skip.

.. parameter:: count
   :type: integer
   :condition: optional

   The number of refunds to return (with a maximum of 250).

Response
--------
``200`` ``application/json``

.. parameter:: totalCount
   :type: integer

   The total number of refunds available.

.. parameter:: offset
   :type: integer

   The number of skipped refunds as requested.

.. parameter:: count
   :type: integer

   The number of refunds found in ``data``, which is either the requested number (with a maximum of 250) or the default
   number.

.. parameter:: data
   :type: array

   An array of refund objects as described in :doc:`Get refund </reference/v1/refunds-api/get-refund>`.

.. parameter:: links
   :type: object

   Links to help navigate through the lists of refunds, based on the given offset.

   .. parameter:: previous
      :type: string

      The previous set of refunds, if available.

   .. parameter:: next
      :type: string

      The next set of refunds, if available.

   .. parameter:: first
      :type: string

      The first set of refunds, if available.

   .. parameter:: last
      :type: string

      The last set of refunds, if available.

Example
-------

Request
^^^^^^^
.. code-block:: bash
   :linenos:

   curl -X GET https://api.mollie.com/v1/payments/tr_7UhSN1zuXS/refunds \
       -H "Authorization: Bearer test_dHar4XY7LxsDOtmnkVtjNVWXLSlXsM"

Response
^^^^^^^^
.. code-block:: none
   :linenos:

   HTTP/1.1 200 OK
   Content-Type: application/json

   {
       "totalCount": 3,
       "offset": 0,
       "count": 3,
       "data": [
           {
               "id": "re_4qqhO89gsT",
               "payment": {
                   "id": "tr_WDqYK6vllg",
                   "mode": "test",
                   "createdDatetime": "2018-03-14T11:26:38.0Z",
                   "status": "refunded",
                   "amount": "35.07",
                   "amountRefunded": "5.95",
                   "amountRemaining": "54.12",
                   "description": "Order #33",
                   "method": "ideal",
                   "metadata": {
                       "order_id": "33"
                   },
                   "details": {
                       "consumerName": "Hr E G H K\u00fcppers en\/of MW M.J. K\u00fcppers-Veeneman",
                       "consumerAccount": "NL53INGB0654422370",
                       "consumerBic": "INGBNL2A"
                   },
                   "locale": "nl_NL",
                   "links": {
                       "webhookUrl": "https://webshop.example.org/payments/webhook",
                       "redirectUrl": "https://webshop.example.org/order/33/",
                       "refunds": "https://api.mollie.com/v1/payments/tr_WDqYK6vllg/refunds"
                   }
               },
               "amount": "5.95",
               "status": "pending",
               "refundedDatetime": "2018-03-14T17:00:50.0Z",
               "description": "Refund of order",
               "links": {
                   "self": "https://api.mollie.com/v1/payments/tr_WDqYK6vllg/refunds/re_4qqhO89gsT"
               }
           },
           { },
           { }
       ]
   }
