## Simple landing page

This site is setup as a static XML document which has the data
necessary to show the landing page. An XML stylesheet `landing.xsl` is used to turn
it into a web page when loaded in the browser.

The links shown can be edited in `landing.xml`, copy or edit a `link`
block and commit it to this repo to save any edits.

## Tailwind
To update any CSS used by the `landing.xsl` stylesheet, run `bunx @tailwindcss/cli -i style.css -o dist/style.css`.

## TODO

- [ ] Find a permanent location for the site, CDN setup etc
- [x] Figure out language selection serverside (right now it's hardcoded on English)
- [ ] Final copy for design and info
- [x] Add styles to match other 50501 properties
