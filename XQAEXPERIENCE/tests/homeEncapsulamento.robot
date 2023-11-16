*** Settings ***
Documentation        Suite de testes do home page 
Library    Browser
Resource   ../Resources/Cap.robot 
*** Test Cases ***
Deve cadastrar um novo dog walker
   
#dados para rodar essa aplicação
    ${name}           Set Variable             Natanael
    ${email}              Set Variable             ngsneto@gmail.com
    ${cpf}                Set Variable             0726547474
    ${cep}                Set Variable             58070400
    ${numero}             Set Variable             120  
    ${complemento}        Set Variable             Apto105
    ${addressStreet}      Set Variable             Rua Elias Cavalcanti de Albuquerque
    ${addressNumber}      Set Variable             120
    ${addressDetails}     Set Variable             105
    ${addressDistrict}    Set Variable             Cristo Redentor
    ${addressCityUf}      Set Variable             João Pessoa/PB
    ${url}                Set Variable             i.jpg
     inicia
             # New Browser                                    browser=chromium        headless=False
     # New Page                                       https://walkdog.vercel.app/signup
     # Wait For Elements State                        form h1       visible          5000


     Browser.Get Text                               form h1    equal         Faça seu cadastro    5000

     fillform     ${name}    ${email}    ${cpf}    ${cep}    ${numero}    ${complemento}        ${addressNumber}    ${addressDetails}   ${url}         


*** Keywords ***
fillform 
     [Arguments]  ${name}    ${email}    ${cpf}    ${cep}    ${numero}    ${complemento}      ${addressNumber}    ${addressDetails}   ${url}                  
     Fill Text                                      css=input[name=name]                             ${name}
     Fill Text                                      css=input[name=email]                            ${email}
     Fill Text                                      css=input[name=cpf]                              ${cpf}
     Fill Text                                      css=input[name=cep]                              ${cep}
     Click                                          css=input[type=button][value$=CEP]    
    #validando os campos       
     #Get Property                                   css=input[name=addressStreet]     value  equal   ${addressStreet}   
     #Get Property                                   css=input[name=addressDistrict]   value  equal   ${addressDistrict}       
     #Get Property                                   css=input[name=addressCityUf]     value  equal   ${addressCityUf}       

     Fill Text                                      css=input[name=addressNumber]                    ${numero}
     Fill Text                                      css=input[name=addressDetails]                   ${complemento}    
#vai em inspecionar elemento e clica em Style e em elements styles,  
# #desabilita o checkbox elements.styles com o nome display: none;
#EXECDIR identifica qualquer arquivo que esteja na raiz do projeto que nesse caso a raiz é XQAEXPERIENCE 
    Upload File By Selector                        css=input[type=file]                             ${EXECDIR}/${url}                        

     
  
     Click                                          css=.button-register   # Input Text  
    # submit form                                   xpath=//*[@id="page-walker"]/form/button         Cadastrar     
     ScreenshotLogin
     Sleep                                          60
     #Capture Page Screenshot                        ${EXECDIR}/image  


