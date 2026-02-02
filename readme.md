# JSONPlaceholder API Test Automation

Tässä ohjelmistotestausprojektissa testataan julkista
JSONPlaceholder REST API -rajapintaa.

Projektin tavoitteena on harjoitella:
- REST API -testausta
- testiautomaatiota Robot Frameworkilla
- testaussuunnitelman laatimista
- testitapausten dokumentointia
- API-testausta SoapUI:n avulla

## Testattava järjestelmä
JSONPlaceholder API  
https://jsonplaceholder.typicode.com


## Toteutetut testit
Testit suoritettiin testaussuunnitelman mukaisesti Robot Frameworkin ja SoapUI:n avulla

Robot Framework

- TC-00: Smoke test
- TC-01: GET /posts
- TC-02: GET /posts/{id}
- TC-03: POST /posts
- TC-04: PUT /posts/{id}
- TC-05: PATCH /posts/{id}
- TC-09: Virhe- ja rajatapaukset

SoapUI

- TC-06: GET /users
- TC-07: GET /users/{id}
- TC-08: GET /comments?postId={id}


## Projektin rakenne
- `robot/tests` - testitapaukset
- `robot/resources` - avainsanat ja asetukset
- soapUI/ - SoapUI-projektitiedosto
- docs/ Testaussuunnitelma ja testausraportti

## Testien ajaminen
```powershell
. .\.venv\Scripts\Activate.ps1
robot -d reports robot/tests
