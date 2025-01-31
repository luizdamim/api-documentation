Cancel refund
=============
.. api-name:: Refunds API
   :version: 1

.. warning:: The v1 API has been deprecated and will be shut down 31 December 2024.

             The documentation for canceling refunds in the new v2 API can be found
             :doc:`here </reference/v2/refunds-api/cancel-payment-refund>`. For more information on the v2 API, refer to
             our :doc:`v2 migration guide </payments/migrating-v1-to-v2>`.

.. endpoint::
   :method: DELETE
   :url: https://api.mollie.com/v1/payments/*paymentId*/refunds/*id*

.. authentication::
   :api_keys: true
   :organization_access_tokens: false
   :oauth: true

For certain payment methods, like iDEAL, the underlying banking system will delay refunds until the next day. Until that
time, :doc:`refunds </payments/refunds>` may be canceled manually via the Mollie Dashboard, or programmatically by using
this endpoint.

The refund can only be canceled while the refund's ``status`` field is either ``queued`` or ``pending``. See
:doc:`/payments/refunds` for more information.

Parameters
----------
Replace ``paymentId`` in the endpoint URL by the payment's ID, and replace ``id`` by the refund's ID. For example:
``/v1/payments/tr_7UhSN1zuXS/refunds/re_4qqhO89gsT``.

Access token parameters
^^^^^^^^^^^^^^^^^^^^^^^
If you are creating an app with :doc:`Mollie Connect </connect/overview>`, the ``testmode`` parameter is also
available.

.. parameter:: testmode
   :type: boolean
   :condition: optional
   :collapse: true

   Set this to ``true`` to cancel a test mode refund.

Response
--------
``204 No Content``

Example
-------

Request
^^^^^^^
.. code-block:: bash
   :linenos:

   curl -X DELETE https://api.mollie.com/v1/payments/tr_WDqYK6vllg/refunds/re_4qqhO89gsT \
       -H "Authorization: Bearer test_dHar4XY7LxsDOtmnkVtjNVWXLSlXsM"

Response
^^^^^^^^
.. code-block:: none
   :linenos:

   HTTP/1.1 204 No Content
