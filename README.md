# Stage 2 Cohort 3 Syllabus

## Contribution Guide

### Prerequisites

- `npm install`
- Pandoc: <https://pandoc.org/installing.html>

- To create a text document, simply create a `.md` file where you want it to be under /src
- To create a reveal.js slide show, simply create a `.revealmd` where you want it to be /src

Once all desired change have been made, run `npm run build`. This should remove the existing build from /docs, and build all the files from scratch.

Then push up to the repo.

### Notes

- All links that end in `.md` or `.revealmd` will be converted to `.html`
- Mermaid charts in revealjs have to use `<div class="mermaid">` to be rendered

## Process Help

Nice to haves:

- External CI that builds /docs automatically
- Better revealjs mermaid support (probably will require mermaid/reveal to make changes)
- Better build and serve scripts.
