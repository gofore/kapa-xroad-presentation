class: middle, center

# Liityntäpalvelimen ylläpito ja valvonta

---

# Sisältö

* Palomuurit ja portit
* Prosessit
* Levytilan vapauttaminen
* Konfiguraatioparametrit

---

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

# Liityntäpalvelimen prosessit

* KUVA TÄHÄN

* Lokeihin kirjoitettavaa dataa voidaan säätää eritasoiseksi, esim. DEBUG, INFO ja OFF.

---

# Portit

* KUVA TÄHÄN

---

# Levytila

* Kaikki viestit (header aina, ja body konfiguroituna), sekä niiden tiivisteet ja allekirjoitukset tallentuvat paikalliseen 
tietokantaan jälkikäteistä todennusta varten.
* Kannasta niitä puretaan zip-tiedostoihin ajastetusti /var/lib/xroad -hakemistoon
* Zip-tiedostot täyttävät levyn, ellei niitä siirretä muualle tai poisteta
* Liitetiedostot tallentuvat väliaikaisesti liityntäpalvelimen levylle
    * Levytila asettaa maksimin käsiteltävien liitteiden koolle

---

# Konfiguraatioparametrit

* Parametreilla voidaan säätää esimerkiksi käytettyjä tallennushakemistoja ja ajastuksia mm. messagelogien purkamiseen kannasta
    * Parametrien säätö tehdään ”käsin” konsolin kautta tiedostoa muokkaamalla, ei käyttöliittymän kautta.
* Oletusarvoisesti parametrit ovat hakemistossa /etc/xroad/conf.d
    * Paikalliset muutokset tehdään local.ini -tiedostoon, joka ylikirjoittaa oletusasetukset  

