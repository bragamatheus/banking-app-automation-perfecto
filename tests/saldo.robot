*** Settings ***
Documentation       Suite contendo os testes de saldo da conta

Resource            ../resources/base.resource

Test Setup          Iniciar sessao
Test Teardown       Finalizar sessao


*** Test Cases ***
Deve visualizar saldo da conta
    [Tags]    sal

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/login.json    encoding=utf-8

    Access app with    ${data}[login][sucesso][cpf]    ${data}[login][sucesso][senha]
    Balance eye

Deve visualizar extrato da conta
    [Tags]    ext_con

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/login.json    encoding=utf-8

    Access app with    ${data}[login][sucesso][cpf]    ${data}[login][sucesso][senha]
    Access extract
    Wait Until Page Contains    text=Extrato
