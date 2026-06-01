FROM node:18-alpine

WORKDIR /app

COPY package.json ./

RUN npm install --legacy-peer-deps --verbose

COPY . .

RUN npm run build

RUN npm install -g serve

EXPOSE 10000

CMD ["serve", "-s", "dist", "-l", "10000"]