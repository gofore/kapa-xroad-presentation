# Guide for making presentation

This guide will help you create new presentation with Suomi.fi brand guidelines. If you have some problem try consult other presentations. Here is guideline what you should follow when making presentation and after that more specific introductions to create new presentation and some tips what to use at Remark.

## Guidelines
1. Presentation should start with one sentence (tittle) and end with "Thanks and questions?".
2. If you use pictures plan that they fit the slide. If they are too big and overflow, put that image to empty slide or try to re-crop image so only relevant information is shown.
3. Slide tittle has to always be one liner. This presentation doesn't support with "sininen-palkki" -style two line tittle.
4. There are 3 slide theme choises:
   - `sininen` -theme, which is used mostly to starting and ending pages.
   ![sininen-theme](./images/sininen-theme.png)
   - `sininen-palkki` -theme, which is most common slide to use.
   ![sininen-palkki-theme](./images/sininen-palkki-theme.png)
   - `valkoinen` -theme, is used for whole page pictures and diagrams. This is just with white background and dark color text.

   These themes are used by adding in start of slide: `template: {theme-name}`
5. DO NOT CHANGE start of `presentation.md`-file it is needed for templates to work.
6. Don't end slide show to `---` becouse it will start new slide.

## Creating new presentation

1. Start by initialising presentation by running script:
   ```bash
      ./create-new-presentation.sh presentation-name
   ```
   This will create new folder under koulutukset with name of presentation. After this you probably want to change "tittle" on browser in that presentation. This is done by editing `tittle`-element in file: `koulutukset/{presentation-name}/index.html`.
2. Now you can create presentation by editing file: `koulutukset/{presentation-name}/presentation.md` and you are done.
3. You can test and see your presentation in browser by running simple python html server on your machine. Use in `koulutukset`-folder either:
   - Python version 2: `python -m SimpleHTTPServer 8000`
   - Python version 3: `python -m http.server`

   And you can access your presentation in: `localhost:8000/{presentation-name}`

## Tips for using remark

Here is some tips for using remark and how to get different kinda styles.

### Slides

Here is few really simply slide examples. Slides should start with
```
---
template:{theme-name}
```

Example of starting slide:
```markdown
   ---
   template: header

   # This is tittle of slide

```

Example of slide with agenda:
```markdown
   ---
   template: sininen-palkki

   # Agenda:
   1. Introductions
   2. Example
   3. Questions?

```

Example of slide with big image:
```markdown
   ---
   template: valkoinen

   ![BIG-IMAGE](/path/to/really/big/diagram)

```

### Images
 - Resizing pictures happens with css, you would probably need to create more rules for that if those what are now choices don't do. Here we use image -element's alt -attribute to identify pictures.

 And this is how you show images in markdown:
```markdown
   ![alt](/path/to/image.filetype)
```

### Links
Links are pretty simple. Just use syntax shown here.
```markdown
   [link-text](www.link.com)
```

### Code highlights
You can also you regular markdown code highlighting:
```````markdown
 ```javascript
       function simple() {
          return "Hello World";
       }
 ```
``````

### Add item one by one

There was example of agenda before, what if you would like to add one item per click to slide. Here is way to do that:

```markdown
   ---
   template: sininen-palkki

   # Agenda:
   1. Introductions

   --

   2. Example

   --

   3. Questions?

```

### If you want continue with same tittle than last slide

There is way to keep same title with few different slides if you don't want to write it (or picture in start). You will need add `layout: true` to start of slide and then first slide what you create will be "template" for nexts and after you are done you need to add slide after you want stop using layout, `layout: false` as in next example is shown.

```markdown
   ---
   template: sininen-palkki
   layout: true
   # Agenda:

   ---

   - Example

   ---

   - Questions?

   ---
   template: header
   layout: false
   # The end
```
