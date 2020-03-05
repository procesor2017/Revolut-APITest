*** Variables ***
${URL}                              https://sandbox-b2b.revolut.com
${GRANT_TYPE}                       refresh_token
${REFRESH_TOKEN}                    oa_sand_rwb9tNl10pg2G4zYiSxIN5LlEUc52dvuyRdmCxpLStA
${CLIENT_ID}                        jYRotSFiLchjZK38wN9HuLE3ydBlUnZgyRRYKzyPSO0
${CLIENT_ASSERTION_TYPE}            urn:ietf:params:oauth:client-assertion-type:jwt-bearer
${CLIENT_ASSERTION}                 eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJqWVJvdFNGaUxjaGpaSzM4d045SHVMRTN5ZEJsVW5aZ3lSUllLenlQU08wIiwiaXNzIjoicmV2b2x1dC1qd3Qtc2FuZGJveC5nbGl0Y2gubWUiLCJhdWQiOiJodHRwczovL3Jldm9sdXQuY29tIn0.Qb9G6DytZKGx0cUPOEd37bis79mWfN-frAm4pnjz64kg00FedvS_pVfJ9mE4kHkepr-B0OwW0carhFkN0xGND74SJUORy1VPbfObjSSVV_04B5yZ7V1uKQ3BRADzOtIt6EfHPCnD5rCoEnJR2cy4sTz7lSjypBy09iCaqUXYuDU
${BEARER}                           Bearer
${ACC_ID}                           7f7798f5-d97c-49d3-b172-33f54d91f58f
${ACC_INVALID_ID}                   111111111111111111111111111111111111
${RAND_INT}                         Evaluate    random.randint(0,10000000)  modules=random
oa_sand_sepAnAiszogdIR7-FxBOf4x_pTcChQdKXicXF5pDTds


${INVALID_ADRESS}                   bank-detakopa
${JSON_COUNTERPARTY}                {"company_name":"John Smith Co.","bank_country":"GB","currency":"GBP","account_no":"12345678","sort_code":"223344","email":"john@smith.co","phone":"+447771234455","address":{"street_line1":"1 Canada Square","street_line2":"Canary Wharf","region":"East End","postcode":"E115AB","city":"London","country":"GB"}}EOF