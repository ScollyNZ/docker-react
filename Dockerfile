FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install --loglevel=verbose
COPY . .
RUN npm run build --loglevel=verbose

FROM nginx
COPY --from=builder /app/build /usr/share/nginx
