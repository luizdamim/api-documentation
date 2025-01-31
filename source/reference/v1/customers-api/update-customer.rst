Update customer
===============
.. api-name:: Customers API
   :version: 1

.. warning:: The v1 API has been deprecated and will be shut down 31 December 2024.

             The documentation for updating customers in the new v2 API can be found
             :doc:`here </reference/v2/customers-api/update-customer>`. For more information on the v2 API, refer to our
             :doc:`v2 migration guide </payments/migrating-v1-to-v2>`.

.. endpoint::
   :method: POST
   :url: https://api.mollie.com/v1/customers/*id*

.. authentication::
   :api_keys: true
   :organization_access_tokens: false
   :oauth: true

Update an existing customer.

Parameters
----------
Replace ``id`` in the endpoint URL by the customer's ID, for example ``cst_8wmqcHMN4U``.

.. parameter:: name
   :type: string
   :condition: optional

   The full name of the customer.

.. parameter:: email
   :type: string
   :condition: optional

   The email address of the customer.

.. parameter:: locale
   :type: string
   :condition: optional

   Allows you to preset the language to be used in the hosted payment pages shown to the consumer. When this parameter
   is not provided, the browser language will be used instead in the payment flow (which is usually more accurate).

   Possible values: ``en_US`` ``en_GB`` ``nl_NL`` ``nl_BE`` ``fr_FR`` ``fr_BE`` ``de_DE`` ``de_AT`` ``de_CH`` ``es_ES``
   ``ca_ES`` ``pt_PT`` ``it_IT`` ``nb_NO`` ``sv_SE`` ``fi_FI`` ``da_DK`` ``is_IS`` ``hu_HU`` ``pl_PL`` ``lv_LV`` ``lt_LT``

.. parameter:: metadata
   :type: mixed
   :condition: optional

   Provide any data you like, and we will save the data alongside the customer. Whenever you fetch the customer with our
   API, we will also include the metadata. You can use up to 1kB of JSON.

Access token parameters
^^^^^^^^^^^^^^^^^^^^^^^
If you are using :doc:`organization access tokens </overview/authentication>` or are creating an
:doc:`OAuth app </connect/overview>`, the ``testmode`` parameter is also available.

.. parameter:: testmode
   :type: boolean
   :condition: optional
   :collapse: true

   Set this to ``true`` to update a test mode customer.

Response
--------
``200`` ``application/json``

A customer object is returned, as described in :doc:`Get customer </reference/v1/customers-api/get-customer>`.

Example
-------

Request
^^^^^^^
.. code-block:: bash
   :linenos:

   curl -X POST https://api.mollie.com/v1/customers/cst_8wmqcHMN4U \
       -H "Authorization: Bearer test_dHar4XY7LxsDOtmnkVtjNVWXLSlXsM" \
       -d "name=Customer A" \
       -d "email=customer@example.com"

Response
^^^^^^^^
.. code-block:: none
   :linenos:

   HTTP/1.1 200 OK
   Content-Type: application/json

   {
       "resource": "customer",
       "id": "cst_8wmqcHMN4U",
       "mode": "test",
       "name": "Customer A",
       "email": "customer@example.com",
       "locale": "nl_NL",
       "metadata": null,
       "recentlyUsedMethods": [],
       "createdDatetime": "2016-04-06T13:10:19.0Z"
   }
