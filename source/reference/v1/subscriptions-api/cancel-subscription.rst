Cancel subscription
===================
.. api-name:: Subscriptions API
   :version: 1

.. warning:: The v1 API has been deprecated and will be shut down 31 December 2024.

             The documentation for canceling subscriptions in the new v2 API can be found
             :doc:`here </reference/v2/subscriptions-api/cancel-subscription>`. For more information on the v2 API,
             refer to our :doc:`v2 migration guide </payments/migrating-v1-to-v2>`.

.. endpoint::
   :method: DELETE
   :url: https://api.mollie.com/v1/customers/*customerId*/subscriptions/*id*

.. authentication::
   :api_keys: true
   :organization_access_tokens: false
   :oauth: true

A subscription can be canceled any time by calling ``DELETE`` on the resource endpoint.

Parameters
----------
Replace ``customerId`` in the endpoint URL by the customer's ID, and replace ``id`` by the subscription's ID. For
example: ``/v1/customers/cst_stTC2WHAuS/subscriptions/sub_rVKGtNd6s3``.

Access token parameters
^^^^^^^^^^^^^^^^^^^^^^^
If you are creating an app with :doc:`Mollie Connect </connect/overview>`, the ``testmode`` parameter is also
available.

.. parameter:: testmode
   :type: boolean
   :condition: optional
   :collapse: true

   Set this to ``true`` to cancel a test mode subscription.

Response
--------
``204 No Content``

Example
-------

Request
^^^^^^^
.. code-block:: bash
   :linenos:

   curl -X DELETE https://api.mollie.com/v1/customers/cst_stTC2WHAuS/subscriptions/sub_rVKGtNd6s3 \
       -H "Authorization: Bearer test_dHar4XY7LxsDOtmnkVtjNVWXLSlXsM"

Response
^^^^^^^^
.. code-block:: none
   :linenos:

   HTTP/1.1 204 No Content
