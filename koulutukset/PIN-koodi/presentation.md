layout: true
name: sininen-palkki
class: sininen-palkki
![logo](../suomifi_logo.svg)

---
layout: true
name: valkoinen
class: valkoinen
![logo](../suomifi_logo.svg)

---
layout: true
name: header
class: center, middle, sininen
![logo](../suomifi_logo.svg)

<!--DON'T TOUCH ABOVE THIS !!!!!! -->
---

template: header
# PIN-koodi

---

template: sininen-palkki
class: split-55

# PIN-koodin rajoitukset

.column[
- Suojaa hallintakäyttöliittymään konfiguroituja avaimia
- Liityntäpalvelimen asentajan päättämä koodi, jonka pituus on vähintään 10 merkkiä.
- PIN-koodissa pitää olla merkkejä vähintään kolmesta luokasta:
   - pienet kirjaimet,
   - isot kirjaimet,
   - numerot,
   - erikoismerkit.
- PIN-koodi täytyy säilyttää turvallisessa paikassa.
   - Palauttaminen ei ole mahdollista
]
.column[![PIN-koodi](../images/PIN-koodi.png)]

---

template: sininen-palkki

# PIN-koodin virheitä

- PIN-koodi syötettävä aina palvelimen uudelleenkäynnistyksen jälkeen uudelleen
- Sanomien lähettäminen epäonnistuu, jos koodin aktivointi on jäänyt tekemättä.
- Sanomat palauttavat faultcodea, joita voi tarkastella proxy-lokista
- Kutsujan liityntäpalvelimella PIN-koodi syöttämättä:
![PIN-koodi-syöttämättä](../images/PIN-koodi-lipa-syottamatta.png)
- Tarjoajan liityntäpalvelimella PIN-koodi syöttämättä:
![PIN-koodi-syöttämättä](../images/PIN-koodi-tarjoaja-syottamatta.png)

---

template: sininen-palkki

# Automaattinen PIN-koodin syöttö

- Automaattinen PIN-koodin syöttäminen on mahdollista
   - Kehitystyössä käytössä ratkaisu, joka tallentaa koodin selväkielisenä palvelimelle
   - Automatisoitujen Ansible + SSH -skriptien käyttö myös mahdollista
   - Näiden tai oman ratkaisun käyttö tässä vaiheessa aina käyttäjän tietoinen valinta!
- Tätä varten tekeillä tuettu tietoturvallinen ratkaisu helpottamaan mm. kuormantasaajaliityntäpalvelimien ylläpitoa

---
template: header
# Kysymyksiä?
