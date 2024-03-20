*** Settings ***
Documentation       Suite contendo os testes de limites da conta

Resource            ../resources/base.resource

Test Setup          Iniciar sessao
Test Teardown       Finalizar sessao


*** Test Cases ***
Deve consultar limite pix    
    [Tags]    lim_pix    lim

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/limits.json    encoding=utf-8
    Access app with    cpf=${data}[limits][cpf]    senha=${data}[limits][senha]
    Scroll app
    Access my limits
    limits PIX

Deve consultar limite ted
    [Tags]    lim_ted    lim

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/limits.json    encoding=utf-8
    Access app with    cpf=${data}[limits][cpf]    senha=${data}[limits][senha]
    Scroll app
    Access my limits
    limits TED

Deve consultar limite pagamentos de boletos
    [Tags]    lim_pag       lim

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/limits.json    encoding=utf-8
    Access app with    cpf=${data}[limits][cpf]    senha=${data}[limits][senha]
    Scroll app
    Access my limits
    limits Pagamentos de Boletos

Deve consultar limite transferência entre contas Trampay
    [Tags]    lim_tra    lim

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/limits.json    encoding=utf-8
    Access app with    cpf=${data}[limits][cpf]    senha=${data}[limits][senha]
    Scroll app
    Access my limits
    limits Transferência entre contas Trampay

Deve consultar limite PIX Saque e PIX Troco
    [Tags]    lim_pix_saq    lim

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/limits.json    encoding=utf-8
    Access app with    cpf=${data}[limits][cpf]    senha=${data}[limits][senha]
    Scroll app
    Access my limits
    limits PIX Saque e PIX Troco

    
    