# Forma de uso: ejemplo

POST http://localhost:9300/aprobarPago

{
  "monto":999,
  "numeroTarjeta":"4509953566233704",
  "anioExpiracion":2035,
  "mesExpiracion":1
}

# Ejemplo por terminal

```
curl --request POST \
  --url http://localhost:9300/aprobarPago \
  --header 'Content-Type: application/json' \
  --data '{"monto":999,"numeroTarjeta":"4509953566233704","anioExpiracion":2035,"mesExpiracion":1}'
```
