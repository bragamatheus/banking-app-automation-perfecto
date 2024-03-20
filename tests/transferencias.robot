*** Settings ***
Documentation       Suite contendo os testes de saldo da conta

Resource            ../resources/base.resource

Test Setup          Iniciar sessao
Test Teardown       Finalizar sessao


*** Test Cases ***
Deve realizar transfer PIX phone
    [Tags]    pix

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/transfer.json    encoding=utf-8

    Access app with    cpf=${data}[transfer][pix][cpf]    senha=${data}[transfer][pix][senha]
    Access pix
    Access transfer pix
    Select Key Option    option=${celular}    key=${data}[transfer][pix][phone]
    Transfer value    valor=10000
    Scroll app
    Entry description    desc=transfer pix para ${data}[transfer][pix][name-fav]
    Check transfer
    Transactional password
    Transfer voucher    mensagem=Pix realizado com sucesso!

Deve realizar transfer PIX cpf
    [Tags]    pix

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/transfer.json    encoding=utf-8

    Access app with    cpf=${data}[transfer][pix][cpf]    senha=${data}[transfer][pix][senha]
    Access pix
    Access transfer pix
    Select Key Option    option=${cpf_cnpj}    key=${data}[transfer][pix][cpf-cnpj]
    Transfer value    valor=10000
    Scroll app
    Entry description    desc=transfer pix para ${data}[transfer][pix][name-fav]
    Check transfer
    Transactional password
    Transfer voucher    mensagem=Pix realizado com sucesso!

Deve realizar transfer PIX email
    [Tags]    pix

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/transfer.json    encoding=utf-8

    Access app with    cpf=${data}[transfer][pix][cpf]    senha=${data}[transfer][pix][senha]
    Access pix
    Access transfer pix
    Select Key Option    option=${email}    key=${data}[transfer][pix][email]
    Transfer value    valor=10000
    Scroll app
    Entry description    desc=transfer pix para ${data}[transfer][pix][name-fav]
    Check transfer
    Transactional password
    Transfer voucher    mensagem=Pix realizado com sucesso!

Deve realizar transfer PIX chave aleatoria
    [Tags]    pix

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/transfer.json    encoding=utf-8

    Access app with    cpf=${data}[transfer][pix][cpf]    senha=${data}[transfer][pix][senha]
    Access pix
    Access transfer pix
    Select Key Option    option=${chave_aleatoria}    key=${data}[transfer][pix][chave_aleatoria]
    Transfer value    valor=10000
    Scroll app
    Entry description    desc=transfer pix para ${data}[transfer][pix][name-fav]
    Check transfer
    Transactional password
    Transfer voucher    mensagem=Pix realizado com sucesso!

Deve realizar agendamento de transfer PIX
    [Tags]    pix_age

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/transfer.json    encoding=utf-8

    Access app with    cpf=${data}[transfer][pix][cpf]    senha=${data}[transfer][pix][senha]
    Access pix
    Access transfer pix
    Select Key Option    option=${email}    key=${data}[transfer][pix][email]
    Date transfer scheduling
    Transfer value    valor=5000
    Scroll app
    Entry description    desc=transfer pix para ${data}[transfer][pix][name-fav]
    Check transfer
    Transactional password
    Transfer voucher    mensagem=Pix agendado com sucesso!

Deve realizar transfer P2P
    [Tags]    p2p

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/transfer.json    encoding=utf-8

    Access app with    cpf=${data}[transfer][p2p][cpf]    senha=${data}[transfer][p2p][senha]
    Access transfer
    Access transfer p2p
    P2p input identifier    105.019.080-72    # doc=cpf=${data}[transfer][p2p][doc]
    P2p input description    desc=cpf=${data}[transfer][p2p][desc]
    Scroll app
    P2p input value    val=cpf=${data}[transfer][p2p][val]
    Transactional password
    Transfer voucher    mensagem=Transferência realizada com sucesso!

Deve realizar transfer TED DOC Novo contato
    [Tags]    ted_new

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/transfer.json    encoding=utf-8

    Access app with    cpf=${data}[transfer][ted_novo][cpf]    senha=${data}[transfer][ted_novo][senha]
    Access transfer
    Access transfer ted doc
    New contact
    Ted select institution    301
    Tipo Conta    Conta Corrente
    Agencia conta e dig
    ...    agencia=${data}[transfer][ted_novo][agencia]
    ...    conta=${data}[transfer][ted_novo][conta]
    ...    dig=${data}[transfer][ted_novo][dig]
    Ted input cpf cnpj    doc=${data}[transfer][ted_novo][doc]
    Scroll app
    Ted input complete name    nome=${data}[transfer][ted_novo][nome]
    Ted form submit
    Ted input description    desc=transfer pix para ${data}[transfer][ted_novo][nome]
    Ted input value    val=${data}[transfer][ted_novo][val]
    Ted button continuar

    Transactional password
    Transfer voucher    mensagem=Transferência realizada com sucesso!

Deve realizar transfer TED DOC para um contato cadastrado
    [Tags]    ted

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/transfer.json    encoding=utf-8

    Access app with    cpf=${data}[transfer][ted][cpf]    senha=${data}[transfer][ted][senha]
    Access transfer
    Access transfer ted doc
    Click on contact    contato=${data}[transfer][ted][contato]
    Button transfer
    Ted input description    desc=Transferencia TED para: ${data}[transfer][ted][contato]
    Ted input value    val=${data}[transfer][ted][val]
    Ted button continuar
    Transactional password
    Transfer voucher    mensagem=Transferência realizada com sucesso!

Deve realizar Pix Copia e Cola
    [Tags]    pix_cop

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/transfer.json    encoding=utf-8

    Access app with    cpf=${data}[transfer][code][cpf]    senha=${data}[transfer][code][senha]
    Access pix
    Access copy and paste
    Input copy past    qrcode=${data}[transfer][code][qrcode]
    Destinatario copy past
    Conferir pagamento copy past
    Transactional password
    Transfer voucher    mensagem=Pix realizado com sucesso!

Deve realizar Pix QRcode
    [Tags]    pix_qrc

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/transfer.json    encoding=utf-8

    Access app with    cpf=${data}[transfer][code][cpf]    senha=${data}[transfer][code][senha]
    Access pix
    Access pix qr code
    Wait Until Page Contains    text=Pagar com QR Code
    Wait Until Page Contains    text=Aponte a câmera para um QR code do Pix

Deve consultar minhas chaves
    [Tags]    pix_cha

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/transfer.json    encoding=utf-8

    Access app with    cpf=${data}[transfer][pix][cpf]    senha=${data}[transfer][pix][senha]
    Access pix
    Access my keys
    Wait Until Page Contains    text=Gerenciar chaves

Deve consultar Meus limites Pix transferência
    [Tags]    pix_lim_tra

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/transfer.json    encoding=utf-8

    Access app with    cpf=${data}[transfer][pix][cpf]    senha=${data}[transfer][pix][senha]
    Access pix
    Access my limit
    Limites Pix transferência
    Wait Until Page Contains    text=Limites Pix

Deve consultar Meus limites Pix saque e pix troco
    [Tags]    pix_saq_tro

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/transfer.json    encoding=utf-8

    Access app with    cpf=${data}[transfer][pix][cpf]    senha=${data}[transfer][pix][senha]
    Access pix
    Access my limit
    Limites Pix saque e Pix troco
    Wait Until Page Contains    text=Limite PIX Saque/Troco

Deve visualizar extrato pix
    [Tags]    ext_pix

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/transfer.json    encoding=utf-8

    Access app with    cpf=${data}[transfer][pix][cpf]    senha=${data}[transfer][pix][senha]
    Access pix
    Extract pix
    Wait Until Page Contains    text=Extrato