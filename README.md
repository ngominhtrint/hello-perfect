# hello-perfect
Implement swift server side by using perfect from scratch

### References

```
https://github.com/PerfectlySoft/PerfectDocs/blob/master/guide/gettingStartedFromScratch.md
```

### Setup

```
swift build
.build/debug/hello-perfect
```

### Api

- GET Hello message
```
http://localhost:8181/
```

- GET list people
```
http://localhost:8181/api/v1/people
```

- POST new person
```
http://localhost:8181/api/v1/people/json

//JSON body
{
    "email": "rover.dream55@gmail.com",
    "firstName": "Rover",
    "lastName": "Dream"
}
```
