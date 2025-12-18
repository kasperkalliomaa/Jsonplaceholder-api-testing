# JSONPlaceholder API Test Automation

Tässä ohjelmistotestausprojektissa testataan julkista
JSONPlaceholder REST API -rajapintaa.

Projektin tavoitteena on harjoitella:
- REST API -testausta
- testiautomaatiota Robot Frameworkilla
- testaussuunnitelman laatimista
- testitapausten dokumentointia

## Testattava järjestelmä
JSONPlaceholder API  
https://jsonplaceholder.typicode.com


## Toteutetut testit
- TC-01: GET /posts
- TC-02: GET /posts/{id}
- TC-03: POST /posts
- TC-04: PUT /posts/{id}
- TC-05: PATCH /posts/{id}

Testit on toteutettu Robot Frameworkilla ja ne noudattavat
testaussuunnitelmaa, jonka voi lukea kansiosta.

## Projektin rakenne
- `robot/tests` - testitapaukset
- `robot/resources` - avainsanat ja asetukset

## Testien ajaminen
```powershell
. .\.venv\Scripts\Activate.ps1
robot -d reports robot/tests
