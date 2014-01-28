## How to update emails list

Start
-

- Create or update `lib/emails.text` with new emails e.g.:
```
email1@example.com
email2@example.com
email3@example.com
email4@example.com
```

Keys
-

- Use existing key from `.env` or generate a new one:

- Generate private key and encode it with Base64

```
openssl genrsa -out private.pem 4056
cat private.pem | base64 --wrap=0
```

- Set new value of private key for `ENV[APP_KEY_SECRET]` on the server side

- Generate public key from private and encode it with Base64

```
openssl rsa -in private.pem -out public.pem -pubout
cat public.pem | base64 --wrap=0
```

Encryption
-

- Run `bin/encrypt -k PUBLIC_KEY`. Where PUBLIC_KEY is generated and
  base64 encoded public key.

Finish
-

- Remove `private.pem` and `public.pem` keys:
  `rm private.pem public.pem`

Go live
-

- Add `emails.text.encrypted` to the repo and push to the server

```
git add lib/emails.text.encrypted
git commit -m 'New list of emails'
git push server branch
```
