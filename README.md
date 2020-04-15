## Get started

Install the dependencies...

```bash
npm install
```

...then you can start [hapi](https://hapi.dev) server

```bash
npm run dev
```

Navigate to [localhost:3000](http://localhost:3000). You should see your app running. Edit a file in
`src`, save it, changes will appear automatically.

don't forget environnement variables required variables are defined in [.env.example](.env.example)

## Building and running in production mode

To create a js version of the app run:

```bash
npm run build
```

You can run the newly built app with `npm run start`

don't forget to set NODE_ENV to production

## Docker Image

to buyild a docker image of this application run the [build.sh](build.sh) script. it takes the name
of the image to create and the location of the Dockerfile. It will install the dependencies before
creating the image

```bash
sh build.sh [name] [Dockerfile location]
```

## Git Recommandations

you'll need to follow
[gitflow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) practices in
order to participate to this project

## Tests

tests are run with [jest](https://www.jestjs.io)

to run tests run

```bash
npm run test
```

tests are run each time you push to the git repository

## Deploying

app deployed with [heroku](https://www.heroku.com)

staging version is deployed automatically when develop branch is updated
https://mspr-maint-stg.herokuapp.com/

production version is deployed automatically when master branch is updated
https://mspr-maint-prod.herokuapp.com/hello

Note: don't forget to change the environnements variables when deploying to a different
environnement
