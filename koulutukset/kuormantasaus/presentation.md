class: sininen
# Kuormantasaus

* Mitä haetaan?
   * Korkea saatavuus (HA) ✓
   * Suorituskyky 
   
Aiheena palvelun*tarjoajan* kuormantasaus

✓ = saatavilla tällä hetkellä
---
class: sininen
# Kaksi tapaa
## Sisäinen kuormantasaus
* Saatavilla 
* Kutsuja tietää, että käyttää useaa liityntäpalvelinta

## Ulkoinen kuormantasaus
* Tulossa Q2/2017
* Kutsuja kuvittelee käyttävänsä yhtä liityntäpalvelinta


---
class: sininen
# Sisäänrakennettu HA-tuki
 
* X-Roadissa on sisäänrakennettuna yksinkertainen korkean saatavuuden mekanismi
* Jos sama palvelu* on rekisteröity usealle liityntäpalvelimelle, käytetään sitä liityntäpalvelinta joka vastaa nopeiten

(*) Sama palvelu = sama organisaatio & alijärjestelmä & palvelu

.center[![small-image](../images/internal-load-balancer.png)]
---
class: sininen
# Sisäänrakennettu HA-tuki
 
* Jos tämä liityntäpalvelin lakkaa vastaamasta pyyntöihin, aletaan kutsua seuraavaksi nopeimmin vastaavaa
* Ratkaisu siis auttaa saavuttamaan korkean saatavuuden (HA)

.center[![small-image](../images/internal-load-balancer.png)]

---
class: sininen
# Sisäänrakennettu HA-tuki: ongelma
 
* Jos tällaiseen klusteriin kuuluu liityntäpalvelimet SS1, SS2, SS3, jokin niistä on 
yleensä nopein vastaamaan pyyntöihin ("lyhyimmät piuhat")
* Yksi klusterin nodeista vastaa kaikkiin pyyntöihin, toiset laiskottelevat
* Ei ole juuri hyödyksi suorituskyvyn suhteen

---

class: sininen
# Sisäänrakennettu HA-tuki: muutoksia
* Versiossa 6.7.13 parannettiin toimintaa luotettavammaksi (verkko)virhetilanteissa
* Versiossa 6.9 parannetaan yhteysavausten nopeutta ja luotettavuutta, ja lisätään konfiguraatio-optioita
* H2/2017 tullaan toteuttamaan parannuksia, jotka mm. mahdollisesti korjaavat edellisellä kalvolla mainitun ongelman

---
class: sininen
# Ulkoinen kuormantasaus
# Toimintaperiaate
![image](../images/external-load-balancer.png)

---
class: sininen
## Toimintaperiaate
* Klusteriin kuuluu n kappaletta nodeja
* Kaikki palvelevat aktiivisesti asiakkaita (ei hot standby)
* Ulkomaailma näkee nämä yhtenä nodena
* Yksi node on konfiguraation suhteen master, muut slaveja
* Väylässä on siis virallisesti yksi liityntäpalvelin, ja epäviralliset slave nodet teeskentelevät olevansa se

---
class: sininen
# Tekninen toteutus
* Konfiguraatiotietokanta on klusteroitu
  * PostgreSQL streaming replication (hot standby)
* Konfiguraatiotiedostot kopioidaan masterilta slaveille
  * Rsync+ssh
  * Ajastetusti
* Slaveilla
  * On read-only käyttäjä
  * Tai ei ole ollenkaan käyttöliittymää
* Healthcheck
* XRoad-sovellukseen on tehty muutoksia jotka mahdollistavat klusteroinnin
 
---
class: sininen
# Ulkoisen klusteroinnin käyttöönotto
* Asennus
   * Ansible
   * Asennus käsin https://github.com/vrk-kpa/X-Road/blob/PVAYLADEV-698-feature-load-balancer-install-instructions/doc/Manuals/LoadBalancing/ig-xlb_x-road_external_load_balancer_installation_guide.md
* Varsinainen kuormanjakaja (ELB, F5, nginx...) out of scope
* Konfigurointi tehdään master nodelle
* Konfiguraatiomuutokset päivittyvät master -> slavet viiveellä
   * -> klusteri hetken epäkonsistentti
---