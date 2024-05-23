*** Settings ***
Documentation       Elementos e ações de login

Resource            ../base.resource
Library             XML


*** Keywords ***
Start trampay app
    ${el} =    Set Variable    //*[@text="CONTINUE"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Fill in the CPF or CNPJ field
    [Arguments]    ${cpf}

    Wait Until Page Contains    text=Para começar, insira seu documento

    ${el} =    Set Variable    accessibility_id=input-document

    Wait Until Element Is Visible    ${el}    30
    Clear Text    ${el}
    Input Text    ${el}    ${cpf}
    Hide keyboard

Confirm button
    ${el} =    Set Variable    accessibility_id=button-confirm

    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Access with another CPF/CNPJ
    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="Acessar com outro CPF/CNPJ"]
    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Fill in password field
    [Arguments]    ${senha}

    Wait Until Page Contains    text=Para acessar digite a sua senha.

    ${el} =    Set Variable    accessibility_id=input-password
    Wait Until Element Is Visible    ${el}    30
    Input Text    ${el}    ${senha}
    Hide keyboard

Continue button authorization device
    Wait Until Page Contains
    ...    text=Você está em um dispositivo diferente do confiável. Para garantir a sua segurança, precisaremos confirmar que é você através de um código de verificação.

    ${el} =    Set Variable    accessibility_id=continue-authorization-device

    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Verification code
    Wait Until Page Contains    text=Enviamos um código de verificação para você. Preencha-o abaixo:

    ${el} =    Set Variable
    ...    //android.widget.EditText[@resource-id="verification-code-input"]

    Wait Until Element Is Visible    ${el}    60

    ${code} =    Set Variable    000000
    Sleep    5
    Input Text    ${el}    ${code}

    ${el_buuton} =    Set Variable    xpath=//android.widget.TextView[@text="CONTINUAR"]

    Wait Until Element Is Visible    ${el_buuton}    60
    Element Should Be Enabled    ${el_buuton}

    Click Element    ${el_buuton}

Access account button
    Wait Until Page Contains    text=Eba! Aparelho autorizado!!
    Wait Until Page Contains
    ...    text=Perfeito! Agora você já consegue realizar as suas transações de forma segura utilizando a sua Conta Trampay

    ${el} =    Set Variable    accessibility_id=access-account

    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

    Wait Until Page Contains    text=Saldo atual

Scroll app
    Sleep    1
    Swipe By Percent    50    90    50    10

Alert message
    [Arguments]    ${mensagem}

    Wait Until Page Contains    ${mensagem}

Forgot your password
    ${el} =    Set Variable    xpath=//android.widget.TextView[@text="Esqueceu a sua senha?"]

    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

    ${el1} =    Set Variable     //android.view.ViewGroup[@content-desc="button-i-understood"]
    Wait Until Element Is Visible    ${el1}    30
    Click Element    ${el1}     

Fill in document field
    [Arguments]    ${doc}
    
    ${el} =    Set Variable    accessibility_id=input-new-password
    Wait Until Element Is Visible    ${el}    30
    Input Text    ${el}    ${doc}

    ${el1} =    Set Variable    accessibility_id=input-confirm-new-password
    Wait Until Element Is Visible    ${el1}    30
    Input Text    ${el1}    ${doc}

Continue button
    ${el} =    Set Variable    accessibility_id=continue-reset-password

    Wait Until Element Is Visible    ${el}    30
    Click Element    ${el}

Success Message
    [Arguments]    ${mensagem}
    Wait Until Page Contains    text=${mensagem}
