*** Settings ***
Documentation       Suite contendo os testes de login

Resource            ../resources/base.resource

Test Setup          Iniciar sessao
Test Teardown       Finalizar sessao


*** Test Cases ***
Deve efetuar login com sucesso
    [Tags]    suc

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/login.json    encoding=utf-8

    Start trampay app
    Fill in the CPF or CNPJ field    ${data}[login][sucesso][cpf]
    Confirm button
    Fill in password field    ${data}[login][sucesso][senha]
    Confirm button
    Continue button authorization device
    Verification code
    Access account button

Nao deve logar com CPF inválido
    [Tags]    inv

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/login.json    encoding=utf-8

    Start trampay app
    Fill in the CPF or CNPJ field    ${data}[login][invalido][cpf]
    Confirm button
    Alert message    Esse CPF está inválido.

Deve redefinir sua senha [Esqueceu a sua senha?]
    [Tags]    pass

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/login.json    encoding=utf-8

    Start trampay app
    Fill in the CPF or CNPJ field    ${data}[login][pass][cpf]
    Confirm button
    Forgot your password
    Fill in document field    ${data}[login][pass][senha]
    Continue button
    Verification code
    Success Message   Você redefiniu sua senha com sucesso!

Nao deve logar sem preencher CPF
    [Tags]    sem

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/login.json    encoding=utf-8

    Start trampay app
    Fill in the CPF or CNPJ field    ${EMPTY}
    Confirm button
    Alert message    Esse campo é obrigatório.

Deve entrar com outra conta
    [Tags]    out

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/login.json    encoding=utf-8

    Start trampay app
    Fill in the CPF or CNPJ field    ${data}[login][pass][cpf]
    Confirm button
    Access with another CPF/CNPJ   
    Fill in the CPF or CNPJ field    ${data}[login][sucesso][cpf]
    Confirm button
    Fill in password field    ${data}[login][sucesso][senha]
    Confirm button
    Continue button authorization device
    Verification code
    Access account button