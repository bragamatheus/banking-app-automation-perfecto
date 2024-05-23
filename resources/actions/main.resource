*** Settings ***
Documentation       Elementos e ações da pagina principal - Screen main

Resource            ../base.resource


*** Variables ***
###    opcoes chaves pix
${celular}                          accessibility_id=select-key-phone
${cpf_cnpj}                         accessibility_id=select-key-cpf-cnpj
${email}                            accessibility_id=select-key-email
${chave_aleatoria}                  accessibility_id=select-key-random
${el_key}                           //android.widget.EditText[@text="Digite a chave"]

###    Itens do perfil
${Sair}                             xpath=//*[@text="Sair"]
${Ajuda}                            xpath=//*[@text="Ajuda"]
${Dados_pessoais}                   xpath=//*[@text="Dados pessoais"]
${Informe_rendimentos}              xpath=//*[@text="Informe de rendimentos"]
${Alterar_senha_app}                xpath=//*[@text="Alterar senha do app"]
${Alterar_senha_transacional}       xpath=//*[@text="Alterar senha transacional"]
${Termos_uso}                       xpath=//*[@text="Termos de uso"]
${Politica_privacidade}             xpath=//*[@text="Política de privacidade"]
${Avaliar_app}                      xpath=//*[@text="Avaliar o app"]
${Excluir_dados_pessoais}           xpath=//*[@text="Excluir dados pessoais"]
${Encerrar_conta}                   xpath=//*[@text="Encerrar conta"]


*** Keywords ***
Access app with
    [Arguments]    ${cpf}    ${senha}

    Start trampay app
    Fill in the CPF or CNPJ field    ${cpf}
    Confirm button
    Fill in password field    ${senha}
    Confirm button
    Continue button authorization device
    Verification code
    Access account button

Balance eye
    ${el} =    Set Variable    xpath=(//*[@resource-id="android:id/content"]//android.view.ViewGroup[5])[1]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Access extract
    ${el} =    Set Variable    accessibility_id=access-extract
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Access transfer
    ${el} =    Set Variable    accessibility_id=access-transfer
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

    Wait Until Page Contains    text=Transferência

Access deposit
    ${el} =    Set Variable    accessibility_id=access-deposit
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Access deposit ticket
    ${el} =    Set Variable    accessibility_id=access-deposit-ticket
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Message access deposit ticket
    Wait Until Page Contains    text=Digite um valor entre R$ 20,00 e R$ 30.000,00

Input value deposit
    [Arguments]    ${valor}

    ${el} =    Set Variable    accessibility_id=input-value-deposit
    Wait Until Element Is Visible    ${el}    30
    Input Text    ${el}    ${valor}

    Sleep    1
    ${el_cont} =    Set Variable    xpath=//android.widget.TextView[@text="CONTINUAR"]
    Wait Until Element Is Visible    ${el_cont}    30
    Click Element    ${el_cont}

Acess deposit ted doc
    ${el} =    Set Variable    accessibility_id=acess-deposit-ted-doc
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Share data
    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="COMPARTILHAR DADOS"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Receive Pix
    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="Receber Pix"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Cadastrar chave
    ${el_chave} =    Set Variable     //android.view.ViewGroup[@content-desc="CADASTRAR CHAVE"]
    Wait Until Element Is Visible    ${el_chave}    30
    Click Element        ${el_chave}   

    ${el_prox} =    Set Variable     //android.view.ViewGroup[@content-desc="PRÓXIMO"]
    Wait Until Element Is Visible    ${el_prox}    30
    Click Element        ${el_prox} 

    ${el_ok} =    Set Variable     //android.view.ViewGroup[@content-desc="OK, ENTENDI"]
    Wait Until Element Is Visible    ${el_ok}    30
    Click Element       ${el_ok} 

    Sleep     2
    ${el_ativ} =    Set Variable     //android.view.ViewGroup[@content-desc="Chave: 105.019.080-72, Status: Ativo"]
    Wait Until Element Is Visible        ${el_ativ}     30
    Click Element            ${el_ativ}

    Sleep     1
    ${el_volt} =    Set Variable     //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup
    Wait Until Element Is Visible        ${el_volt}     30
    Click Element       ${el_volt}  

    Receive Pix


Select key
    
    ${cadastrar_chave_visible} =    Run Keyword        Cadastrar chave

    Run Keyword If    ${cadastrar_chave_visible}    Cadastrar chave
    ...    ELSE
    ...    Log    A opção 'Cadastrar chave' não foi encontrada na tela.

    ${el} =    Set Variable    accessibility_id=select-key
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

    ${el_k} =    Set Variable
    ...    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup
    Wait Until Element Is Visible    ${el_k}    30
    Click Element    ${el_k}

    Sleep       2

    ${el} =    Set Variable    accessibility_id=select-key
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

    ${el_k} =    Set Variable
    ...    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup
    Wait Until Element Is Visible    ${el_k}    30
    Click Element    ${el_k}

Input description
    [Arguments]    ${texto}

    ${el} =    Set Variable    accessibility_id=input-description
    Wait Until Element Is Visible    ${el}    30
    Input Text    ${el}    ${texto}

input value pix
    [Arguments]    ${valor}

    ${el} =    Set Variable    accessibility_id=input-value
    Wait Until Element Is Visible    ${el}    30
    Input Text    ${el}    ${valor}

    Sleep    1
    ${el_cont} =    Set Variable    xpath=//android.widget.TextView[@text="CONTINUAR"]
    Wait Until Element Is Visible    ${el_cont}    30
    Click Element    ${el_cont}

Access pix
    ${el} =    Set Variable    accessibility_id=access-pix
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

    Sleep    2
    Wait Until Page Contains    text=Pix

Extract pix
    ${el} =    Set Variable    accessibility_id=extract-pix
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Access my keys
    Sleep    2
    ${el} =    Set Variable    accessibility_id=access-my-keys
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

    Sleep    1
    ${el1} =    Set Variable    xpath=//android.widget.TextView[@text="PRÓXIMO"]
    Wait Until Element Is Visible    ${el1}    30
    Click Element    ${el1}

    Sleep    1
    ${el2} =    Set Variable    xpath=//android.widget.TextView[@text="OK, ENTENDI"]
    Wait Until Element Is Visible    ${el2}    30
    Click Element    ${el2}

Access my limit
    Sleep    2
    ${el} =    Set Variable    accessibility_id=access-my-limit
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Limites Pix transferência
    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="Limites Pix transferência"]
    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}
    Click Element    ${el}

Limites Pix saque e Pix troco
    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="Limites Pix saque e Pix troco"]
    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}
    Click Element    ${el}

Access transfer pix
    Sleep    2
    ${el_tra_pix} =    Set Variable    xpath=//android.view.ViewGroup[@content-desc="access-transfer-pix"]
    Wait Until Element Is Visible    ${el_tra_pix}    30
    Element Should Be Enabled    ${el_tra_pix}
    Click Element    ${el_tra_pix}

    # Wait Until Page Contains    text=Transferência por chave


Button continuar
    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="CONTINUAR"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Date transfer scheduling
    ${el} =    Set Variable    xpath=//*[@resource-id="undefined-open-button"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

    Sleep    1

    ${date_format} =    Set Variable    %d
    ${data_atual} =    Get Current Date    result_format=${date_format}

    ${dia_atual} =    Convert To Integer    ${data_atual}
    ${um_dia_depois} =    Set Variable    ${dia_atual + 1}

    ${dia} =    Set Variable    xpath=//android.widget.TextView[@text="${um_dia_depois}"]
    Click Element    ${dia}

    ${el} =    Set Variable    xpath=//android.view.ViewGroup[@resource-id="undefined-button"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Transfer value
    [Arguments]    ${valor}

    Sleep    2
    ${el} =    Set Variable    accessibility_id=input-value-pix
    Wait Until Element Is Visible    ${el}    30
    Input Text    ${el}    ${valor}

Pix form submit
    Sleep    1
    ${el} =    Set Variable     //android.view.ViewGroup[@content-desc="pix-form-submit"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

    Sleep    1
    ${el1} =    Set Variable     //android.view.ViewGroup[@content-desc="CONTINUAR"]
    Wait Until Element Is Visible    ${el1}    30
    Click Element    ${el1}

Entry description
    [Arguments]    ${desc}

    ${el} =    Set Variable    accessibility_id=input-description
    Wait Until Element Is Visible    ${el}    30
    Input Text    ${el}    ${desc}

    Sleep    1
    Button continuar

Check transfer
    # Wait Until Page Contains    text=Conferir transferência
    # Wait Until Page Contains    text=Dados da transferência
    Button continuar

Transactional password
    # Wait Until Page Contains    text=Senha

    ${el} =    Set Variable
    ...    xpath=//android.widget.EditText[@resource-id="smooth-pin-code-input"]

    Wait Until Element Is Visible    ${el}    30
    Element Should Be Enabled    ${el}

    Input Text    ${el}    3256

    Sleep    1
    Button finish

Button finish

    ${el1} =    Set Variable    xpath=//*[@text="FINALIZAR"]
    ${el2} =    Set Variable    accessibility_id=validate-code-button

    ${isVisible} =    Run Keyword And Return Status    Element Should Be Visible    ${el1}
    IF    '${isVisible}' == 'True'
        Click Element    ${el1}
    ELSE
        Click Element    ${el2}
    END

Transfer voucher
    [Arguments]    ${mensagem}

    ${el} =    Set Variable
    ...    xpath=//android.widget.TextView[@text="${mensagem}"]

    Wait Until Element Is Visible    ${el}    30

Access transfer p2p
    Sleep    2
    ${el} =    Set Variable        //android.view.ViewGroup[@content-desc="Entre contas Trampay"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}


P2p input identifier
    [Arguments]    ${doc}

    ${el} =    Set Variable    //android.widget.EditText
    Wait Until Element Is Visible    ${el}    30
    Sleep    2
    Input Text    ${el}    ${doc}

    Sleep    1
    ${el1} =    Set Variable     //android.view.ViewGroup[@content-desc="CONTINUAR"]
    Wait Until Element Is Visible    ${el1}    30
    Click Element    ${el1}

P2p form submit
    ${el_p2p} =    Set Variable    accessibility_id=p2p-form-submit
    Wait Until Element Is Visible    ${el_p2p}    30
    Click Element    ${el_p2p}

P2p input description
    [Arguments]    ${desc}

    ${el} =    Set Variable    accessibility_id=p2p-input-description
    Wait Until Element Is Visible    ${el}    30
    Input Text    ${el}    ${desc}

P2p input value
    [Arguments]    ${val}

    ${el} =    Set Variable    accessibility_id=p2p-input-value
    Wait Until Element Is Visible    ${el}    30
    Input Text    ${el}    ${val}

    Sleep    1
    P2p form submit

Access transfer ted doc
    ${el} =    Set Variable     //android.view.ViewGroup[@content-desc="access-transfer-ted-doc"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

New contact
    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="Novo contato"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Ted select institution
    [Arguments]    ${banco}
    clicar no combo

    # buscar instituicao
    ${instituicao} =    Set Variable    xpath=//*[@text="Buscar instituição"]

    Wait Until Element Is Visible    ${instituicao}    30
    Element Should Be Enabled    ${instituicao}
    Input Text    ${instituicao}    ${banco}

    # clicar no elmento encntrado
    ${el} =    Set Variable    xpath=//*[@text="301 Dock Ip S/A"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

clicar no combo
    ${el-instituicao} =    Set Variable    accessibility_id=ted-select-institution

    Wait Until Element Is Visible    ${el-instituicao}    30
    Element Should Be Enabled    ${el-instituicao}
    Click Element    ${el-instituicao}

Tipo Conta
    [Arguments]    ${tp_conta}

    ${el} =    Set Variable    xpath=//android.view.ViewGroup[@content-desc="ted-input-account"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

    Sleep    1

    # @{el_tp_conta} =    Create List    Conta Corrente    Conta Poupança
    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="${tp_conta}"]
    Click Element    ${el}

Agencia conta e dig
    [Arguments]    ${agencia}    ${conta}    ${dig}

    ${input_agencia} =    Set Variable    accessibility_id=ted-input-agency
    Wait Until Element Is Visible    ${input_agencia}    30
    Element Should Be Enabled    ${input_agencia}
    Input Text    ${input_agencia}    ${agencia}

    Sleep    1
    ${input_conta} =    Set Variable
    ...    xpath=//android.widget.EditText[@content-desc="ted-input-account"]
    Wait Until Element Is Visible    ${input_conta}    30
    Element Should Be Enabled    ${input_conta}
    Input Text    ${input_conta}    ${conta}
    # Hide keyboard

    ${input_dig} =    Set Variable    accessibility_id=ted-input-digit
    Wait Until Element Is Visible    ${input_dig}    30
    Element Should Be Enabled    ${input_dig}
    Input Text    ${input_dig}    ${dig}
    # Hide keyboard

Ted input cpf cnpj
    [Arguments]    ${doc}

    ${el} =    Set Variable    accessibility_id=ted-input-cpf-cnpj
    Wait Until Element Is Visible    ${el}    30
    Input Text    ${el}    ${doc}

Ted input complete name
    [Arguments]    ${nome}

    ${el} =    Set Variable    accessibility_id=ted-input-complete-name
    Wait Until Element Is Visible    ${el}    30
    Input Text    ${el}    ${nome}

Ted form submit
    ${el} =    Set Variable    accessibility_id=ted-form-submit
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Ted input description
    [Arguments]    ${desc}

    Sleep    1

    Scroll app

    ${el} =    Set Variable    xpath=//*/android.widget.EditText[1]
    Wait Until Element Is Visible    ${el}    30
    Input Text    ${el}    ${desc}

Ted input value
    [Arguments]    ${val}

    Sleep    1

    # Scroll app

    ${el} =    Set Variable    xpath=//*[@text="0,00"]
    Wait Until Element Is Visible    ${el}    30
    Input Text    ${el}    ${val}

Ted button continuar
    ${el} =    Set Variable    xpath=//*[@text="CONTINUAR"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Click on contact
    [Arguments]    ${contato}

    ${el} =    Set Variable    xpath=//*[@text="${contato}"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Button transfer
    ${el} =    Set Variable    accessibility_id=button-transfer
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Access profile
    Scroll app

    ${el} =    Set Variable    accessibility_id=access-my-details
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

    Wait Until Page Contains    text=Perfil

Select profile item
    [Arguments]    ${item}

    Sleep    1
    ${el} =    Set Variable    ${item}
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Confirm exit
    Sleep    1
    ${el} =    Set Variable    accessibility_id=confirm-dialog-primary-action
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

    Wait Until Page Contains    text=Para começar, clique para acessar a conta.

Create password
    ${el} =    Set Variable    xpath=//*[@text="ENTENDI"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Change app password
    [Arguments]    ${senha_atual}    ${nova_senha}    ${confirmar_senha}

    ${el_s} =    Set Variable    accessibility_id=edit-password-current-password-input
    Wait Until Element Is Visible    ${el_s}    30
    Input Text    ${el_s}    ${senha_atual}

    ${el_n} =    Set Variable    accessibility_id=edit-password-new-password-input
    Wait Until Element Is Visible    ${el_n}    30
    Input Text    ${el_n}    ${nova_senha}

    ${el_c} =    Set Variable    accessibility_id=edit-password-confirm-password-input
    Wait Until Element Is Visible    ${el_c}    30
    Input Text    ${el_c}    ${confirmar_senha}

    Sleep    1
    ${el} =    Set Variable    accessibility_id=edit-password-submit-button
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Create new password
    ${el_d} =    Set Variable    xpath=//android.widget.EditText[@resource-id="set-password-new-pin-input"]
    Wait Until Element Is Visible    ${el_d}    30
    Input Text    ${el_d}    3256

    ${el_c} =    Set Variable    xpath=//android.widget.EditText[@resource-id="set-password-confirm-new-pin-input"]
    Wait Until Element Is Visible    ${el_c}    30
    Input Text    ${el_c}    3256

    Sleep    1
    Set password submit button

Set password submit button
    ${el} =    Set Variable    xpath=//*[@resource-id="set-password-submit-button"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Access my limits
    ${el} =    Set Variable    accessibility_id=access-my-limits
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

limits PIX
    ${el} =    Set Variable    xpath=//android.view.ViewGroup[@content-desc="Limites Pix"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

    Wait Until Page Contains    text=Limite PIX

limits TED
    ${el} =    Set Variable    xpath=//android.view.ViewGroup[@content-desc="Limites Ted"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

    Wait Until Page Contains    text=Limite TED

limits Pagamentos de Boletos
    ${el} =    Set Variable    xpath=//android.view.ViewGroup[@content-desc="Pagamentos de Boletos"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

    Wait Until Page Contains    text=Limite de Pagamentos

limits Transferência entre contas Trampay
    ${el} =    Set Variable    xpath=//android.view.ViewGroup[@content-desc="Transferência entre contas Trampay"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

    Wait Until Page Contains    text=Limite entre contas

limits PIX Saque e PIX Troco
    ${el} =    Set Variable    xpath=//android.view.ViewGroup[@content-desc="PIX Saque e PIX Troco"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

    Wait Until Page Contains    text=Limite PIX Saque/Troco

Access copy and paste
    Sleep    4
    ${el} =    Set Variable    accessibility_id=access-copy-and-paste
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Input copy past
    [Arguments]    ${qrcode}

    ${el} =    Set Variable    accessibility_id=input-copy-past
    Wait Until Element Is Visible    ${el}    30
    Input Text    ${el}    ${qrcode}

    Sleep    1
    ${el_c} =    Set Variable    xpath=//android.widget.TextView[@text="CONTINUAR"]
    Wait Until Element Is Visible    ${el_c}    30
    Click Element    ${el_c}

Destinatario copy past
    Sleep    1
    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="CONTINUAR"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Conferir pagamento copy past
    Sleep    1
    ${el} =    Set Variable    xpath=//android.view.ViewGroup[@content-desc="CONTINUAR"]
    
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Access pix qr code
    Sleep    4
    ${el} =    Set Variable    accessibility_id=access-pix-qr-code
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}


Selecionar card celular
    [Arguments]      ${key}
  
    Sleep   1
    ${el} =    Set Variable        //android.view.ViewGroup[@content-desc="Celular"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

    Sleep   1
    ${el1} =    Set Variable        //android.widget.EditText[@resource-id="transfer-select-key-phoneNumber-input"]
    Wait Until Element Is Visible    ${el1}    30
    Input Text    ${el1}    ${key}

    Sleep   1
    ${el2} =    Set Variable        //android.view.ViewGroup[@content-desc="CONTINUAR"]
    Element Should Be Enabled    ${el2}
    Click Element    ${el2}
    

Selecionar card cpf-cnpj
    [Arguments]      ${key}

    Sleep    2
    ${el} =    Set Variable         //android.view.ViewGroup[@content-desc="CPF/CNPJ"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

    Sleep   1
    ${el1} =    Set Variable        //android.widget.EditText[@resource-id="transfer-select-key-nationalRegistration-input"]
    Wait Until Element Is Visible    ${el1}    30
    Input Text    ${el1}    ${key}

    Sleep   1
    ${el2} =    Set Variable        //android.view.ViewGroup[@content-desc="CONTINUAR"]
    Element Should Be Enabled    ${el2}
    Click Element    ${el2}

Selecionar card email
    [Arguments]      ${key}

    ${el} =    Set Variable        //android.view.ViewGroup[@content-desc="E-mail"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

        Sleep   1
    ${el1} =    Set Variable         //android.widget.EditText[@resource-id="transfer-select-key-email-input"]   
    Wait Until Element Is Visible    ${el1}    30
    Input Text    ${el1}    ${key}

    Sleep   1
    ${el2} =    Set Variable        //android.view.ViewGroup[@content-desc="CONTINUAR"]
    Element Should Be Enabled    ${el2}
    Click Element    ${el2}

Selecionar card aleatoria
    [Arguments]      ${key}

    Sleep    3
    ${el} =    Set Variable        //android.view.ViewGroup[@content-desc="Aleatória"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

    Sleep   1
    ${el1} =    Set Variable        //android.widget.EditText[@resource-id="transfer-select-key-evp-input"]
    Wait Until Element Is Visible    ${el1}    30
    Input Text    ${el1}    ${key}

    Sleep   1
    ${el2} =    Set Variable        //android.view.ViewGroup[@content-desc="CONTINUAR"]
    Element Should Be Enabled    ${el2}
    Click Element    ${el2}

Selecionar card banco ag cc
    ${el} =    Set Variable        //android.view.ViewGroup[@content-desc="Banco, Ag e Cc"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}