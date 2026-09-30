# Green Twig Studios

Static export of the Green Twig Studios Webflow site.

## Local preview

```sh
npm install
npm run dev
```

Then open http://localhost:5173. Pages live at the repo root (`index.html`, `about.html`, …); Vite serves `/about` from `about.html`.

## Home page animation

The iframe on the home page (`<iframe src="/landing/">` in `index.html`) loads
`landing/`, a built copy of
[LandingScreen](https://github.com/dggrunzweig/LandingScreen). The source lives
in that repo; `landing/` holds only its build output (`index.html`,
`bundle.js`, `style.css`, `click-start.svg`) and shouldn't be edited by hand.

The copy doesn't update on its own. After changing LandingScreen, rebuild and
copy it here:

```sh
npm run sync:landing                              # from GitHub (latest commit on the default branch)
LANDING_SRC=../LandingScreen npm run sync:landing # from a local checkout, including unpushed changes
```

`scripts/sync-landing.sh` does the work: it clones LandingScreen (or copies
the checkout at `LANDING_SRC`) into a temp directory, runs `npm ci` and
`npm run build` there, and replaces `landing/` with the resulting `dist/`.
LandingScreen's own `node_modules` and `dist/` are never touched.

Typical workflow:

1. Push your LandingScreen changes (or use `LANDING_SRC` to skip this).
2. Run `npm run sync:landing`.
3. Check it with `npm run dev` at http://localhost:5173.
4. Commit and push the updated `landing/` folder.
