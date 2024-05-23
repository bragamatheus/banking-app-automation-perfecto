*** Settings ***
Documentation       Suite contendo os testes de perfil do cliente

Resource            ../resources/base.resource

Test Setup          Iniciar sessao
Test Teardown       Finalizar sessao


*** Test Cases ***
Deve deslogar com sucesso
    [Tags]    sair

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/profile.json    encoding=utf-8

    Access app with    ${data}[profile][cpf]    ${data}[profile][senha]
    Access profile
    Scroll app
    Select profile item    item=${Sair}
    Confirm exit

Deve acessar menu ajuda
    [Tags]    per

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/profile.json    encoding=utf-8

    Access app with    ${data}[profile][cpf]    ${data}[profile][senha]
    Access profile
    Scroll app
    Select profile item    item=${Ajuda}
    Wait Until Page Contains    text=Ajuda

Deve acessar menu Dados pessoais
    [Tags]    dados-pes

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/profile.json    encoding=utf-8

    Access app with    ${data}[profile][cpf]    ${data}[profile][senha]
    Access profile
    Select profile item    item=${Dados_pessoais}
    Wait Until Page Contains    text=Dados pessoais

Deve acessar menu Informe de rendimentos
    [Tags]    inf_ren

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/profile.json    encoding=utf-8

    Access app with    ${data}[profile][cpf]    ${data}[profile][senha]
    Access profile
    Select profile item    item=${Informe_rendimentos}
    Wait Until Page Contains    text=Informe de rendimentos

Deve acessar menu Alterar senha do app
    [Tags]    sen_app

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/profile.json    encoding=utf-8

    Access app with    ${data}[profile][cpf]    ${data}[profile][senha]
    Access profile
    Select profile item    item=${Alterar_senha_app}
    Wait Until Page Contains    text=Criar senha

    Create password
    Change app password    senha_atual=Teste@123    nova_senha=Teste@123    confirmar_senha=Teste@123
    Verification code

    Wait Until Page Contains    text=Sucesso!
    Wait Until Page Contains    text=Senha atualizada!

Deve acessar menu Alterar senha transacional
    [Tags]    sen_tra

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/profile.json    encoding=utf-8

    Access app with    ${data}[profile][cpf]    ${data}[profile][senha]
    Access profile
    Select profile item    item=${Alterar_senha_transacional}
    Wait Until Page Contains    text=Digite a senha atual
    Transactional password
    Create new password
    
    Wait Until Page Contains    text=Sucesso!
    Wait Until Page Contains    text=A sua senha transacional foi alterada com sucesso

Deve acessar menu Termos de uso
    [Tags]    ter_uso

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/profile.json    encoding=utf-8

    Access app with    ${data}[profile][cpf]    ${data}[profile][senha]
    Access profile
    Scroll app
    Select profile item    item=${Termos_uso}
    Wait Until Page Contains    text=Termos de uso

Deve acessar menu Política de privacidade
    [Tags]    pol_pri

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/profile.json    encoding=utf-8

    Access app with    ${data}[profile][cpf]    ${data}[profile][senha]
    Access profile
    Scroll app
    Select profile item    item=${Politica_privacidade}
    Wait Until Page Contains    text=Política de privacidade

Deve acessar menu Avaliar o app
    [Tags]    ava

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/profile.json    encoding=utf-8

    Access app with    ${data}[profile][cpf]    ${data}[profile][senha]
    Access profile
    Select profile item    item=${Avaliar_app}

Deve acessar menu Excluir dados pessoais
    [Tags]    exc_dad

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/profile.json    encoding=utf-8

    Access app with    ${data}[profile][cpf]    ${data}[profile][senha]
    Access profile
    Scroll app
    Select profile item    item=${Excluir_dados_pessoais}
    Wait Until Page Contains    text=Excluir dados pessoais

Deve acessar menu Encerrar conta
    [Tags]    enc_con

    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/profile.json    encoding=utf-8

    Access app with    ${data}[profile][cpf]    ${data}[profile][senha]
    Access profile
    Scroll app
    Select profile item    item=${Encerrar_conta}
    Wait Until Page Contains    text=Encerrar conta
