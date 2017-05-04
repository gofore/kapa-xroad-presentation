# kapa-xroad-presentation

source materials for the pdf presentations, in src/

License for the material https://creativecommons.org/licenses/by/4.0/deed.fi

# Remarkjs presentations

New presentation platform and place where storage them.

## Running presentation on local machine

Depending what version of python you have:

Find out python version: `python --version`

If Python 2.x: `python -m SimpleHTTPServer 8000`

If Python 3.x: `python -m http.server`

## Creating new presentation

Run script `sh create-new-presentation.sh [presentation-name]`

If you add any images to presentation, put them in image folder under koulutukset. That way they can be used in different presentations.

Add new presentation to root folder index page as a link.

```html
<li><a href="koulutukset/{presentation-name}">NIMI</a><br />Lisätietoa</li>
```


## Changing images

When updating image, that image can be used in different presentations, so please don't break others :)

But you can update one image which is in all presentations by keeping same name for new image as old image had. That way all presentations will be updated same time.
