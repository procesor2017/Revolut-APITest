*** Settings ***
Documentation       Suite description
Library             RequestsLibrary
Library             String
Library             Collections
Library             JSONLibrary

*** Variables ***
${url}                              https://sandbox-b2b.revolut.com
${grant_type}                       refresh_token
${refresh_token}                    oa_sand_rwb9tNl10pg2G4zYiSxIN5LlEUc52dvuyRdmCxpLStA
${client_id}                        jYRotSFiLchjZK38wN9HuLE3ydBlUnZgyRRYKzyPSO0
${client_assertion_type}            urn:ietf:params:oauth:client-assertion-type:jwt-bearer
${client_assertion}                 eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJqWVJvdFNGaUxjaGpaSzM4d045SHVMRTN5ZEJsVW5aZ3lSUllLenlQU08wIiwiaXNzIjoicmV2b2x1dC1qd3Qtc2FuZGJveC5nbGl0Y2gubWUiLCJhdWQiOiJodHRwczovL3Jldm9sdXQuY29tIn0.Qb9G6DytZKGx0cUPOEd37bis79mWfN-frAm4pnjz64kg00FedvS_pVfJ9mE4kHkepr-B0OwW0carhFkN0xGND74SJUORy1VPbfObjSSVV_04B5yZ7V1uKQ3BRADzOtIt6EfHPCnD5rCoEnJR2cy4sTz7lSjypBy09iCaqUXYuDU
*** Keywords ***
Start
    create session      AddData     ${url}
    ${body}=    create dictionary   grant_type=${grant_type}       refresh_token=${refresh_token}       client_id=${client_id}         client_assertion_type=${client_assertion_type}       client_assertion=${client_assertion}
    ${response}=    post request   AddData     /api/1.0/auth/token     data=${body}
    ${t}            get from dictionary     ${response.json()}     access_token
    log to console  ${t}

*** Test Cases ***
Test
    Start




