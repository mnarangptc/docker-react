FROM node:alpine as builder
WORKDIR '/app4'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app4/build /usr/share/nginx/html
