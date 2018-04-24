# Make nginx (proxy) reply with ACME challenge

```
server {
    listen          80;
    server_name     example.com;

    location /.well-known/acme-challenge/QWERTYUIOPASDFGHJ_KLZXCVBNMQWERTYUIOPA-SDFG {
        return 200 'QWERTYUIOPASDFGHJ_KLZXCVBNMQWERTYUIOPA-SDFG.qwertyu-iopasdfghjklzxcvbnmqwertyuiiopasdfg';
    }

    ...
}

```


[1] https://serverfault.com/questions/196929/reply-with-200-from-nginx-config-without-serving-a-file
