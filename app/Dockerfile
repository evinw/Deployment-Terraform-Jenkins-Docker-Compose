FROM node:14

WORKDIR /usr/src/corpApp

COPY package.json ./

RUN npm install

COPY . .

EXPOSE 8080

CMD ["node", "app.js"]