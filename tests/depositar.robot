*** Settings ***
Documentation       Suite contendo os testes de depositar

Resource            ../resources/base.resource

Test Setup          Iniciar sessao
Test Teardown       Finalizar sessao


*** Test Cases ***
Deve depositar via boleto valor mínimo
    [Tags]    bol_min

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/deposit.json    encoding=utf-8
    Access app with    cpf=${data}[deposit][bol_min][cpf]    senha=${data}[deposit][bol_min][senha]

    Access deposit
    Access deposit ticket
    Input value deposit    valor=${data}[deposit][bol_min][valor]

    Wait Until Page Contains    text=Sucesso
    Wait Until Page Contains    text=Seu boleto foi gerado e enviado para o seu e-mail cadastrado:

Nao deve depósitar via boleto valor abaixo do permitido
    [Tags]    bol_inf

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/deposit.json    encoding=utf-8
    Access app with    cpf=${data}[deposit][bol_inf][cpf]    senha=${data}[deposit][bol_inf][senha]
    Access deposit
    Access deposit ticket
    Input value deposit    valor=${data}[deposit][bol_inf][valor]
    Message access deposit ticket

Deve depositar via boleto valor maximo
    [Tags]    bol_max

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/deposit.json    encoding=utf-8
    Access app with    cpf=${data}[deposit][bol_max][cpf]    senha=${data}[deposit][bol_max][senha]
    Access deposit
    Access deposit ticket
    Input value deposit    valor=${data}[deposit][bol_max][valor]

    Wait Until Page Contains    text=Sucesso
    Wait Until Page Contains    text=Seu boleto foi gerado e enviado para o seu e-mail cadastrado:

Deve depositar via TED ou DOC
    [Tags]    dep_ted

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/deposit.json    encoding=utf-8
    Access app with    cpf=${data}[deposit][bol_min][cpf]    senha=${data}[deposit][bol_min][senha]
    Access deposit
    Acess deposit ted doc
    Share data
    Scroll app

Deve depositar via Receber Pix
    [Tags]    dep_pix

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/deposit.json    encoding=utf-8
    Access app with    cpf=${data}[deposit][dep_pix][cpf]    senha=${data}[deposit][dep_pix][senha]
    Access deposit
    Receive Pix
    Select key
    Input description    texto=Teste de depositar via pix
    input value pix    valor=${data}[deposit][dep_pix][valor]
    Wait Until Page Contains    text=QR Code gerado
