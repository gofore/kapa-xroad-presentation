layout: true
name: sininen-palkki
class: sininen-palkki
![logo](/suomifi_logo.svg)

---
layout: true
name: header
class: center, middle, sininen
![logo](/suomifi_logo.svg)

---
layout: true
name: valkoinen
class: valkoinen
![logo](/suomifi_logo.svg)

<!--DON'T TOUCH ABOVE THIS !!!!!! -->
---

template: header

# Liityntäpalvelimen ylläpito ja valvonta

---

template: sininen-palkki

# Sisältö

* Prosessit
* Portit
* Levytilan vapauttaminen
* Konfiguraatioparametrit

---

template: sininen-palkki

# Ylläpitotoiminnoista yleisesti

* Liityntäpalvelimen valvonta on suositeltavaa, jotta järjestelmä pysyy stabiilina ja käyttökunnossa
* Liityntäpalvelinohjelmistosta julkaistaan uusia versioita ~2-3 kpl/vuosi sisältäen:
    * Suorituskykyparannuksia
    * Tietoturvapäivityksiä
    * Uusia käyttöä tukevia toiminnallisuuksia  

* Levytilan valvonta on tärkeää, mikä kannattaa kiinnittää huomiota jo asennusvaiheessa
    * Levytila täyttyy jos arkistoituja tietoja ei siirretä talteen tai poisteta
    * Käyttäjämäärät ratkaisevia mm. levytilan ja alustakoneen (tai koneiden) valinnassa.

---

template: sininen-palkki

# Liityntäpalvelimen prosessit

* KUVA TÄHÄN

* Lokeihin kirjoitettavaa dataa voidaan säätää eritasoiseksi, esim. DEBUG, INFO ja OFF.

---

template: sininen-palkki

# Portit

* KUVA TÄHÄN

---

template: sininen-palkki

# Levytila

* Kaikki viestit (header aina, ja body konfiguroituna), sekä niiden tiivisteet ja allekirjoitukset tallentuvat paikalliseen
tietokantaan jälkikäteistä todennusta varten.
* Kannasta niitä puretaan zip-tiedostoihin ajastetusti /var/lib/xroad -hakemistoon
* Zip-tiedostot täyttävät levyn, ellei niitä siirretä muualle tai poisteta
* Liitetiedostot tallentuvat väliaikaisesti liityntäpalvelimen levylle
    * Levytila asettaa maksimin käsiteltävien liitteiden koolle

---

template: sininen-palkki

# Konfiguraatioparametrit

* Parametreilla voidaan säätää esimerkiksi käytettyjä tallennushakemistoja ja ajastuksia mm. messagelogien purkamiseen kannasta
    * Parametrien säätö tehdään ”käsin” konsolin kautta tiedostoa muokkaamalla, ei käyttöliittymän kautta.
* Oletusarvoisesti parametrit ovat hakemistossa /etc/xroad/conf.d
    * Paikalliset muutokset tehdään local.ini -tiedostoon, joka ylikirjoittaa oletusasetukset  
