*** Settings ***
Documentation       Suite description
Library             RequestsLibrary
Library             String
Library             Collections
Library             JSONLibrary
Resource            TestApiVariable.robot

*** Keywords ***
Create Token Session
    create session                  BasicURL     ${URL}     verify=True
    ${body}                         create dictionary   grant_type=${GRANT_TYPE}       refresh_token=${REFRESH_TOKEN}       client_id=${CLIENT_ID}         client_assertion_type=${CLIENT_ASSERTION_TYPE}       client_assertion=${CLIENT_ASSERTION}
    ${response_accesstoken}         post request   BasicURL     /api/1.0/auth/token     data=${body}
    Set Test Variable               ${response_accesstoken}
Get Access Token
    ${access_token}                 get from dictionary     ${response_accesstoken.json()}     access_token
    Set Test Variable               ${access_token}
Get Account List
    create session                  BasicURL    ${URL}      verify=True
    ${headers}                      create dictionary    Authorization=${BEARER} ${access_token}
    ${response_200}                 get request     BasicURL    /api/1.0/accounts       headers=${headers}
    Set Test Variable               ${response_200}
Response 200
    Should be true                  """<Response [200]>""" == """${response_200}"""
Response 204
    Should be true                  """<Response [204]>""" == """${response_204}"""
Response 400
    Should be true                  """<Response [400]>""" == """${response_400}"""
Response 404
    Should be true                  """<Response [404]>""" == """${response_404}"""
Get Specific Account information
    create session                  BasicURL    ${URL}      verify=True
    ${headers}                      create dictionary    Authorization=${BEARER} ${access_token}
    ${response_account_inf}         get request     BasicURL    /api/1.0/accounts/${ACC_ID}       headers=${headers}
    ${response_200}=                Set variable    ${response_account_inf}
    Set Test Variable               ${response_account_inf}
    Set Test Variable               ${response_200}
Account information from Main
    ${name}                         get from dictionary     ${response_account_inf.json()}     name
    Should be true                  """Main""" == """${name}"""
Get Specific invalid Account information
    create session                  BasicURL    ${URL}      verify=True
    ${headers}                      create dictionary    Authorization=${BEARER} ${access_token}
    ${response_account_inf}         get request     BasicURL    /api/1.0/accounts/${ACC_INVALID_ID}       headers=${headers}
    ${response_400}=                Set variable    ${response_account_inf}
    Set Test Variable               ${response_account_inf}
    Set Test Variable               ${response_400}
Set Invalid Adress
    create session                  BasicURL    ${URL}      verify=True
    ${headers}                      create dictionary    Authorization=${BEARER} ${access_token}
    ${response_account_inf}         get request     BasicURL    /api/1.0/accounts/${ACC_ID}/${INVALID_ADRESS}      headers=${headers}
    ${response_404}=                Set variable    ${response_account_inf}
    Set Test Variable               ${response_account_inf}
    Set Test Variable               ${response_404}
Add counterparty
    create session                  BasicURL    ${URL}      verify=True
    ${headers}                      create dictionary    Authorization=${BEARER} ${access_token}
    ${data}                         Create dictionary    profile_type=personal  name=John Smith     phone=+4412345678904
    ${response}                     post request  BasicURL  /api/1.0/counterparty   headers=${headers}      json=${data}
    Set Test Variable               ${response.content}
Add counterparty missing name
    create session                  BasicURL    ${URL}      verify=True
    ${headers}                      create dictionary    Authorization=${BEARER} ${access_token}
    ${data}                         Create dictionary    profile_type=personal      phone=+4412345678904
    ${response_400}                 post request  BasicURL  /api/1.0/counterparty   headers=${headers}      json=${data}
    Set Test Variable               ${response_400}
Add counterparty missing phone number
    create session                  BasicURL    ${URL}      verify=True
    ${headers}                      create dictionary    Authorization=${BEARER} ${access_token}
    ${data}                         Create dictionary    profile_type=personal      name=John Smith
    ${response_400}                 post request  BasicURL  /api/1.0/counterparty   headers=${headers}      json=${data}
    Set Test Variable               ${response_400}
Add counterparty company name
    create session                  basic ${URL}        verify = True
    ${headers}                      create dictionary    Authorization=${BEARER} ${access_token}
    ${response}                post request  BasicURL  /api/1.0/counterparty   headers=${headers}      data=${JSON_COUNTERPARTY}
    ${response_200}                 Set Variable    ${response}
    log to console                  ${response.content}
    Set Test Variable               ${response_200}
    Set Test Variable               ${response}
Get ID counterparty
    ${id_counterparty_json}         TO JSON     ${response.content}
    ${id_counterparty}              Set variable    ${id_counterparty_json['id']}
    Set Test Variable               ${id_counterparty}
    log to console                  ${id_counterparty}
Delete counterparty
    create session                  BasicURL    ${URL}      verify=True
    ${headers}                      create dictionary    Authorization=${BEARER} ${access_token}
    ${response_account_inf}         Delete request     BasicURL    /api/1.0/counterparty/${id_counterparty}      headers=${headers}
    ${response_204}                 Set variable    ${response_account_inf}
    SET Test Variable               ${response_204}


