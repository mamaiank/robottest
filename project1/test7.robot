*** Settings ***
Library  String

*** Test Cases ***
test split
    ${string} =     Set Variable  asd,dsa,zxc
    Log To Console      \n${string}
    @{words} =	    Split String	${string}	,
    Log To Console      \n${words}
    FOR     ${ELEMENT}      IN      @{words}
    Log To Console      \n${ELEMENT}
    END
