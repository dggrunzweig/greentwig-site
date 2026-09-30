# Green Twig Studios

Static export of the Green Twig Studios Webflow site.

## Local preview

```sh
npm install
npm run dev
```

Then open http://localhost:5173. Pages live at the repo root (`index.html`, `about.html`, …); Vite serves `/about` from `about.html`.

## Home page animation

The iframe on the home page loads `landing/`, a built copy of
[LandingScreen](https://github.com/dggrunzweig/LandingScreen). To pull in the
latest version, rebuild and copy it with:

```sh
npm run sync:landing                              # from GitHub (latest commit)
LANDING_SRC=../LandingScreen npm run sync:landing # from a local checkout
```

Then commit the updated `landing/` folder.
