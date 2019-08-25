# Create the password and pass in a imperative manner to kubernetes

```CMD
    kubectl create secret generic pgpassword --from-literal PGPASSWORD=password123
```

The key **pgpassword** will be used into the configurations.
The values inside this key are _key value pairs_, so the key **PGPASSWORD** is a key from the dictionary inside this collections of values hosted under the name of **pgpassword**
