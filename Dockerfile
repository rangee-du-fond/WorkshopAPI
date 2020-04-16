FROM node:lts

WORKDIR /usr/src/app

COPY dist ./

RUN ls

RUN npm i --production && npm audit fix --only=prod

CMD ["npm", "start"]
