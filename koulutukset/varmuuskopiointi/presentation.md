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
# Varmuuskopiointi

---

template: sininen-palkki

# Varmuuskopiointi ja palauttaminen

- Varmuuskopion tekeminen ja palauttaminen onnistuu liityntäpalvelimen käyttöliittymästä.


![varmuuskopiointi-palauttaminen](../images/varmuuskopiointi-palauttaminen.png)

---

template: sininen-palkki

# Varmuuskopiointi

- Tallentaa kaikki /etc/xroad hakemiston konfiguraatiot.
   - Myös avaimet ja varmenteet
- Oletuskansio mihin backupit tallennetaan /var/lib/xroad/backup
- Suositeltava tehtäväksi esimerkiksi
   - Ennen päivitysten asennuksia
   - Yleensä omien konfiguraatioiden jälkeen

---

template: sininen-palkki

# Varmuuskopiointi komentoriviltä

- Ajetaan xroad-käyttäjänä
- Backup kannattaa tehdä oletuskansioon niin se näkyy myös käyttöliittymässä

```bash
$ /usr/share/xroad/scripts/backup_xroad_proxy_confugiration.sh -s AA/GOV/TS1=WNER/TS1 -f /var/lib/xroad/backup/mybackup.tar
```

---

template: sininen-palkki

# Palauttaminen komentoriviltä

- Ajetaan xroad-käyttäjänä
   -  In order to restore configuration, the following command should be used:
   ```bash
   $ /usr/share/xroad/scripts/restpre_xroad_proxy_configuration.sh -s <security server ID> -f <path
   ```
   - For example (all on one line):
   ```bash
   $ /usr/share/xroad/scripts/restore_xroad_proxy_configuration.sh -s AA/GOV/TS1OWNER/TS1 \
   -f /var/lib/xroad/backup/conf_backup_20140703-110438.tar
   ```
   - If its abosolutely necessary to restore the system from a backup made on a different security server, the forced mode of the restore commmand can be used with the -F option. For example (all on one line):
   ```bash
   $ /usr/share/xroad/scripts/restore_xroad_proxy_configuration.sh -F \
   -f /var/lib/xroad/backup/conf_backup_20140703-110438.tar
   ```

---
template: header
# Kysymyksiä?
