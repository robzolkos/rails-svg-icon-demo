# Rails SVG Icons - Cached and Colorable

A demo Rails application showcasing a CSS-only technique for rendering SVG icons that are both cacheable and dynamically colorable.

## Installation

```bash
bundle install
```

## Running the Demo

```bash
bin/rails server
```

Visit [http://localhost:3000](http://localhost:3000)

## What This Demo Showcases

### The Problem

Traditional approaches to SVG icons have tradeoffs:

1. **Inline SVGs** - Colorable via CSS, but bloats HTML and can't be cached
2. **IMG tags** - Cacheable, but can't change colors dynamically
3. **Icon fonts** - Cacheable and colorable, but blurry, accessibility issues, and limited to single color

### The Solution: CSS Masks

This demo uses CSS `mask-image` to get the best of both worlds:

- **Cacheable**: SVG files are loaded once and cached by the browser
- **Colorable**: Colors are applied via `background-color`, not SVG modification
- **Performant**: 10,000 icons on the page = only 4 HTTP requests (one per unique icon)
- **Simple markup**: Each icon is just `<icon data-icon="heart"></icon>`

### How It Works

1. The SVG file is loaded as a `mask-image` (acts as a stencil)
2. The `background-color` shows through where the SVG has filled areas
3. Colors can be changed via CSS classes or custom properties

```css
icon {
  background-color: var(--icon-color, currentColor);
  mask-image: url("icons/heart.svg");
}
```

### Usage

Use the `icon` helper in your views:

```erb
<%= icon :heart %>
<%= icon :heart, color: :red %>
<%= icon :heart, size: :lg %>
<%= icon :heart, color: :blue, size: :sm %>
```

### Adding New Icons

1. Add the SVG file to `app/assets/images/icons/`
2. Add a CSS rule in `app/assets/stylesheets/icons.css`:

```css
icon[data-icon="new-icon"] {
  -webkit-mask-image: url("icons/new-icon.svg");
  mask-image: url("icons/new-icon.svg");
}
```

## Browser Support

CSS masks are supported in all modern browsers:
- Chrome, Edge, Firefox, Safari
- Uses `-webkit-` prefix for Safari compatibility

See [caniuse.com/css-masks](https://caniuse.com/css-masks)
