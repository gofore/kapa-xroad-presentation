class: middle, center
# Tämä on aloitus dia, sen sisältö on keskitetty

---

# Dian vaihto Remarkjs:ssä

Kirjoittamalla markdown tiedostoon '---' aloitetaan uusi dia.

Kirjoittamalla tiedostoon '???' aloitetaan dian komentti osia. Komentti osia ei ole pakollinen

---
name: esimerkki
class: ei-luokkaa, luokkia
background-image: url(kuva.jpg)

# Dian attribuutit

* Dialle voi antaa nimen, kirjoittamalla dian alkuun 'name:' ja dian nimi
* Dialle voi antaa luokkia kirjoittamalla dian alkuun 'class:' ja luokan nimi.
* Dialle voi antaa tausta kuvan kirjoittamalla dian alkuun 'background-image'
* Layout ja templateista: [Remarkjs:n documentaatiossa](https://github.com/gnab/remark/wiki/Markdown#template)

---

# Rivin vaihto markdown:ssa

Markdown syntaxin kirjoittaminen on helppoa. Jos haluat jakaa tekstin useamalle riville, lisää rivin loppuun
```html
  <br>
```
Jolloin rivin vaihto tapahtuu ilman tyhjää tilaa. Mutta yleensä tälle ei ole juuri käyttöä koska Remark osaa jäsennellä rivit dian levyiseksi automaattisesti.

Myös rivin vaihto tapahtuu jättämällä Markdown tiedostoon yhden ylimääräisen tyhjän välin.

---

# Otsikot

Otsikko Markdown:ssa tehdään käytttämällä merkkiä #.

Merkkien lukumäärä kertoo otsikon tason, mitä enemmän sitä pienempi (syvemmällä).

## 2. Tason otsikko ##

### 3. Tason otsikko ###

#### 4. Tason otsikko ####

##### 5. Tason otsikko #####

##### 6. Tason otsikko #######

---

# Listat

Listoja tehdään aloittamalla rivi joko * tai - :
* Listaelementti
  * Sisennetty listaelementti

tai
- Listaelementti
  - Sisennetty listaelementti

Listojen sisennys tapahtuu 2 välilyönnillä.

---

# Koko tekstin asettelu diassa

On mahdollista asetalla dian sisältöä hyödyntäen luokkia. Muutama valmis luokka:
Vertikaalinen asettelu:
```markdown
top (default)
middle
bottom
```

Horisontaalinen asettelu:
```markdown
left (default)
center
right
```

Myös on mahdollista asetella vain teksti palaa:
```markdown
.left[Left-aligned text]
.center[Centered text]
.right[Right-aligned text]
```

---

# Kuvan tai linkin lisääminen

Remarkissa on mahdollista asettaa linkki tai kuva diaan:
```markdown
![Kuvan-alias](/path/to/image tai url.to.image)

<img alt="nimi" src="osoite" height="korkeus" width="leveys" />

[Linkin nimi](url.to.link)

<a href="osoite">Nimi</a>
```
Mikäli haluaa kuvalle tai linkille omia CSS sääntöjä:
```markdown
.right[![Right-aligned image](imageUrl)]
```
Koodi blockin lisääminen markdownissa tapahtuu kirjoittamalla koodi

&#96;&#96;&#96;javascript <br/>
function sum(a, b) { <br/>
  return a + b; <br />
} <br/>
&#96;&#96;&#96;
