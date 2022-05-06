*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem

*** Variables ***
${PATH}  ${CURDIR}/example.txt
*** Test Cases ***
LoginTest
    Create File          ${PATH}
    open browser  https://www.google.com  chrome
    Maximize Browser Window
    input text  name:q  robotframework
    Press Keys  name:q  ENTER
    ${elements}=    Get WebElements    //div[@data-async-context='query:robotframework']/div//a[contains(@href, 'robotframework')]
    FOR    ${element}    IN    @{elements}
    Log To Console    ${element.text}
    append to file   ${PATH}  ${element.text} \n
    END
    close browser



*** Keywords ***
