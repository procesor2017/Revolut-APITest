*** Settings ***
Documentation       Suite description
Library             RequestsLibrary
Library             String
Library             Collections
Library             JSONLibrary
Resource            TestApiVariable.robot
Resource            TestApiKeyword.robot
*** Test Cases ***
TC_001_Get token
    Create token session
    Get Access Token

TC_002_Get All Accounts informations (Acc list)
    Create token session
    Get Access Token
    Get Account list
    Response 200

TC_003_Get specific Account informations
    Create token session
    Get Access Token
    Get Specific Account information
    Response 200
    Account information from Main

TC_004_Get specific Account_invalid ID
    Create token session
    Get Access Token
    Get Specific invalid Account information
    Response 400

TC_005_Get Account Details_invalid Adress (bank_details)
    Create token session
    Get Access Token
    Set Invalid Adress
    Response 404

TC_006_Add singular Revolut Counterparty
    Create token session
    Get Access Token
    Add counterparty
    Get ID counterparty
    Delete counterparty
    Response 204

TC_007_TC_007_Add singular Revolut Counterparty_Missing profile name
    Create token session
    Get Access Token
    Add counterparty missing name
    Response 400

TC_008_Add singular Revolut Counterparty_Missing phone num.
    Create token session
    Get Access Token
    Add counterparty missing phone number
    Response 400

TC_009_Add singular Non-Revolut Counterparty
    Create token session
    Get Access Token
    Add counterparty company name
    Response 200
    Get ID counterparty
    Delete counterparty

