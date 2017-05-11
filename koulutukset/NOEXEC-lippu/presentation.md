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

# NOEXEC-lippu

---

template: sininen-palkki

# /tmp ja NOEXEC

- Mikäli /tmp sijaitsee tiedostojärjestelmässä, joka on mountattu NOEXEC-lippu päällä, admin käyttöliittymä ei toimi.
![NOEXEC-lippu](../images/Noexec-lippu.png)

---

template: sininen-palkki

# Miksi NOEXEC?

- NOEXEC-lippu estää tiedostojärjestelmän tiedostojen suorittamisen
- Käytössä muun muassa kovennetuissa ympäristöissä
- Liityntäpalvelimen käyttöliittymän JRuby-toteutus  käyttää asennuspaketin mukana tulleita natiivikirjastoja niin, että purkaa ne oletuksena /tmp hakemistoon

---

template: sininen-palkki

# NOEXEC – ongelman kiertäminen

- Ongelman kiertämiseksi on [ohje](https://esuomi.fi/palveluntarjoajille/palveluvayla/tekninen-aineisto/hyva-tietaa/ohje-kayttoliittyman-avautumisongelmaan-kovennetuissa-ymparistoissa/)
- Käyttöliittymän temp-hakemistoksi vaihdetaan jokin muu, jossa NOEXEC-lippu ei estä suorittamista

```bash
cd /home/xroad
mkdir tmp
chown xroad:xroad tmp
chmod 700
```
- /etc/xroad/services/local-conf:
```yml
JETTY_PARAMS=" $JETTY_PARAMS -DJava.io.tmpdir=/home/xroad/tmp/ "
```

---
template: header
# Kysymyksiä?
