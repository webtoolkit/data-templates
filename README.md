# Simplest JavaScript Template Engine
That's a bold claim, but it is pretty easy, pinky promise!

## Usage
Every element that has an attribute that you want to be rendered, should also have an empty `data-tpl` attribute.

### Attributes
There are 6 possible data attributes
 - `data-tpl-html` sets `el.innerHTML`
 - `data-tpl-text` sets `el.innerText`
 - `data-tpl-href` sets `el.href`
 - `data-tpl-src` sets `el.src`
 - `data-tpl-alt` sets `el.alt`
 - `data-tpl-title` sets `el.title`

### Creating a template

``` html
<div id="my-template">
    <span data-tpl data-tpl-text="data.something"></span>
</div>
```

### Rendering the template
``` js
// Prepare the template
var template = new Template(document.getElementById('my-template'));

// Render it
var result = template.render({
    something: 'This is some text'
});

// Add it to the document
document.appendChild(result);
```

### Advanced usage
As the content of the data attribute is just JavaScript, you can also do more complex things.

``` html
<!-- Functions -->
<span data-tpl data-tpl-text="data.something.toUpperCase()"></span>

<!-- Simple if -->
<span data-tpl data-tpl-text="data.wants_something ? data.something : ''"></span>
```
