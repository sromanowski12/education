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
An inline style loses many of the advantages of style sheets by mixing content with presentation. This could be useful if we want to override conflicting style information.

2. Embedded: part of HTML document & within `<style>` tag
An internal style sheet should be used when a single document has a unique style. You define internal styles in the head section of an HTML page, by using the
<style> tag,
3. External CSS: loaded (linked to) HTML document
An external style sheet is ideal when the style is applied to many pages. With an external style sheet, you can change the look of an entire Web site by changing one file. Each page must link to the style sheet using the <link> tag. The <link> tag goes inside the head section

- Ex. `<link rel="stylesheet" type="text/css" href="mystyle.css">`

External CSS
CSS is included in HTML document with `<link>` within `<head>`
- **rel** attribute specifies the relationship of the link
- **type**: specifies document's MIME type as "text/css"
- **href**: specifies the URL of the style sheet

```html
<link rel="stylesheet" type="text/css" href="style.css">
```

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
Specified by the following methods:
- Hexadecimal colors
- RGB colors
- RGBA colors
- HSL colors
- Predefined color names

**Background Properties**
Used to defined background effects on an element
- background-color
- background-image
- background-repeat
- background-attachment
- background-position

**Font / Text Properties**
- font properties: define the font family, font size, style, weight of the text
- text properties: define the shadow, alignmnet, and decoration
- margin property: allows user to specify the margin for a given object

- font-size property
  - Can be expressed as:
    - percentage relative to normal size
    - pixels
    - centimeters
    - inches
    - predefined values

- font-style: 
- font-weight: defines the thickness of characters
- font-family: multiple font name are provided as a "fallback" in case a browser isn't compatible.
  - If browser does not support the first font, it tries the next font

- text-shadow: attaches one or more shadows to text
  - attaches one or more shadows to text
  - It's a comma seperated list of shadow directions, followed by blur radius and color

- text-decoration
  - includes:
    - None
    - Underline
    - Overline
    - Line-through
    - Blink

- margin: sets all the margin properties in one declaration
  - Ex.

```css
margin: 10px 5px 15px 20px;
```
**Conflicting Styles: Inheritance (Cascading Styles)**


**Box Model & Flow**
All block-level elements have a virtual box drawn around them

Block-level element is surrounded by the following:
- Padding
- Border
- Margin

**Creating Borders & Boxes**
Border Width:
- thick
- medium
- thin

Border Style:
- solid
- double
- groove
- ridge
- dotted
- dashed
- inset
- onset

Border Images:
```css
border-image:url(border.png) 30 30 round;
```

Border Radius:
- corner properties
  - border-top-left-radius
  - border-bottom-right-radius
- border-radius

**Boxes & Shadows**:
box-shadow
- Ex. box-shadow: 10px 10px 5px #888888;

**Positioning**
Static:
```css
div.background {
    position: static;
    height: 500px;
    width: 500px;
}
```
Relative:
```css

```
Absolute:
```css

```
Fixed:
```css

```


**Event Handling w/ CSS (Pseudo-Classes)**
Typically performed by client-side or server-side programming language but some events are handled nicely by CSS styles

Ex. change opacity of an image and hover over it, change background by hovering over it
*Achieved by CSS psuedo-class selectors*

**Pseudo-Class Selectors**: used to add special effect to "some" selectors
- apply to elements when theyire in a certain state or condition

**Syntax**:
- selector:pseudo-class {property:value;}
- Ex.
  p:hover {color:green;}

**Overlow Attribute (vs. iframe)**

**Figure & Fig-Caption Tags**

**Animation & Transformation *translation, scaling, rotation)**

