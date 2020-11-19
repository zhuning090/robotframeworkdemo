*** Settings ***
Documentation     这是一个简单的网页测试
Library           SeleniumLibrary
Suite Setup       Open Browser    ${HOMEPAGE}    ${BROWSER}
Test Setup        Go To    ${HOMEPAGE}
Suite Teardown    Close All Browsers

*** Variables ***
${HOMEPAGE}       http://www.baidu.com
${BROWSER}        chrome

*** Test Cases ***
百度搜索并检查
    [Tags]    template-Test
    [Template]    百度搜索内容并检查
    安信    www.essence.com
    腾讯    www.qq.com
    京东    www.JD.com

百度搜索安信并检查
    [Tags]    web    essence    smoke
    百度搜索内容并检查    安信    www.essence.com

百度搜索腾讯并检查
    [Tags]    web    qq
    百度搜索内容并检查    腾讯    www.qq.com

百度搜索京东并检查
    [Tags]    web    JD    smoke
    百度搜索内容并检查    京东    www.JD.com

*** Keywords ***
百度搜索内容并检查
    [Arguments]    ${searchKey}    ${result}
    Input Text    id=kw    ${searchKey}
    Click Button    id=su
    Wait Until Page Contains    ${result}
