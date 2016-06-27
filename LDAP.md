Populating the ldap:

```
docker exec -it mycontainer ldapadd -x -D "cn=admin,dc=example,dc=com" -w admin -f /example.ldif -c
```

Default ldap config:

```
host: ldap
port: 389
dn: ou=People,dc=example,dc=com
username: cn=admin,dc=example,dc=com
password: admin
```
