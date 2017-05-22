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
# Käyttäjäryhmät

---

template: sininen-palkki

# Käyttäjäryhmät

- Liityntäpalvelimen asennuksen yhteydessä luodaan automaattisesti yksi admin-käyttäjä, jolla on oikeudet kaikkiin admin-käyttöliittymän toimintoihin
- Käyttöoikeudet rakentuvat osista hienojakoisemmin ja tietylle käyttäjälle voidaan antaa vain tarvittavat oikeudet
- Käyttäjäryhmät on kuvattu tarkemmin liityntäpalvelimen user guidessa ([SS User Guide](https://github.com/vrk-kpa/X-Road/blob/develop/doc/Manuals/ug-ss_x-road_6_security_server_user_guide.md#21-user-roles)) ja samassa dokumentissa on kerrottu mihin toimintoihin kullakin ryhmällä on oikeus

---

template: sininen-palkki

# Käyttäjäryhmät

- xroad-security-officer
   - Tietoturvapolitiikka, avaimet ja varmeet
- xroad-registration-officer
   - Asiakasjärjestelmien rekisteröinti ja poistaminen
- xroad-service-administrator
   - Palveluiden konfigurointi
- xroad-system-administrator
   - Liityntäpalvelimen asennus, konfiguraatio ja ylläpito
- xroad-securityserver-observer
   - Katseluoikeus kaikkiin käyttöliittymän tietoihin  

---

template: sininen-palkki

# Käyttäjäryhmät

- Kuormantasaukseen liittyen on lisätty uusi xroad-securityserver-observer (Q2/2017)
   - Voidaan käyttää klusterin slave-nodeilla
   - Voidaan käyttää myös muuten read-only käyttäjien tekemiseen

---

template: sininen-palkki

# Käyttäjäryhmät

- Uuden admin-käyttäjän lisääminen tarkoittaa käytännössä linux-käyttäjän liittämistä johonkin xroad-käyttäjäryhmään/-ryhmiin

```bash
$ sudo usermod -a -G xroad-service-administrator exampleadmin
```

---
template: header
# Kysymyksiä?
