Revoke mandate
==============
.. api-name:: Mandates API
   :version: 1

.. warning:: The v1 API has been deprecated and will be shut down 31 December 2024.

             The documentation for revoking mandates in the new v2 API can be found
             :doc:`here </reference/v2/mandates-api/revoke-mandate>`. For more information on the v2 API, refer to our
             :doc:`v2 migration guide </payments/migrating-v1-to-v2>`.

.. endpoint::
   :method: DELETE
   :url: https://api.mollie.com/v1/customers/*customerId*/mandates/*id*

.. authentication::
   :api_keys: true
   :organization_access_tokens: false
   :oauth: true

Revoke a customer's mandate. You will no longer be able to charge the consumer's bank account or credit card with this
mandate.

Parameters
----------
Replace ``customerId`` in the endpoint URL by the customer's ID, and replace ``id`` by the mandate's ID. For example:
``/v1/customers/cst_stTC2WHAuS/mandates/mdt_pWUnw6pkBN``.

Access token parameters
^^^^^^^^^^^^^^^^^^^^^^^
If you are creating an app with :doc:`Mollie Connect </connect/overview>`, the ``testmode`` parameter is also
available.

.. parameter:: testmode
   :type: boolean
   :condition: optional
   :collapse: true

   Set this to ``true`` to revoke a test mode mandate.

Response
--------
``204 No Content``

Example
-------

Request
^^^^^^^
.. code-block:: bash
   :linenos:

   curl -X DELETE https://api.mollie.com/v1/customers/cst_stTC2WHAuS/mandates/mdt_pWUnw6pkBN \
       -H "Authorization: Bearer test_dHar4XY7LxsDOtmnkVtjNVWXLSlXsM"

Response
^^^^^^^^
.. code-block:: none
   :linenos:

   HTTP/1.1 204 No Content
