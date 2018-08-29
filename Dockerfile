#everythng from here will belong to builder phase
FROM node:alpine as builder

WORKDIR './app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# based on this we will be given 
# /app/build <--- thats where all of the important files are

# Another phase
FROM nginx:stable-alpine
# copy something from builder phase assigned above
COPY --from=builder /app/build /usr/share/nginx/html

# it starts by itself