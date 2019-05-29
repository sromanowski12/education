Some of the most important CSS3 modules are:
- Selectors
- Box modules
- Backgrounds & Borders
- Text Effects
- 2D/3D Transformations
- Animations
- Multiple Column Layout
- User Interfaces

Can be defined:
1. Inline: as attributes of a tag
2. Embedded: part of HTML document & within `<style>` tag
3. External CSS: loaded (linked to) HTML document
- Ex. `<link rel="stylesheet" type="text/css" href="mystyle.css">`

External CSS
CSS is included in HTML document with `<link>` within `<head>`
- **rel** attribute specifies the relationship of the link
- **type**: specifies document's MIME type as "text/css"
- **href**: specifies the URL of the style sheet

CSS Rules
- 2 Parts:
```css
Selector { Declaration;...}
```
  - Selector: typically an HTML element
  - Declaration: typically one or more style attributes

CSS Comments
```css
/* This is a comment */
```

The ID Selector
- id Selector: used to specify a style for a single, unique element
- Uses id attribute of HTML element
- Defined with a "#"
```html
<style>
    #style1
    {
        text-align:center;
        color:red;
        font-weight:bold;
    }
</style>
<body>
    <p id="style1">Hello World!</p>
</body>
```

The Class Selector
- class Selector is used to specify a style for a group of elements
- Allows setting style for many HTML elements with the same class
- class Selector uses the HTML class attribute and is defined with a "." in front of the selector

```html
<style>
    .center
    {
        text-align:center;
        color:red;
        font-weight:bold;
    }
</style>
<body>
    <p class="center">Hello World!</p>
</body>
```

Selector for specified elements, defined by p.center
```html
<style>
    p.center
    {
        text-align:center;
        color:red;
        font-weight:bold;
    }
</style>
<body>
    <p class="center">Hello World!</p>
</body>
```

**Color & Background Color**
