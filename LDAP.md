Populating the ldap:

´´´
docker cp ldap/example.ldiff mycontainer:/example.ldiff   
docker exec -it mycontainer ldapadd -x -D "cn=admin,dc=example,dc=com" -w admin -f /example.ldiff -c
```
