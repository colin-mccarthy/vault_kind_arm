






Create file on your local machine



my_policy
```
path "kv/developers/ansible/metadata/*"{
capabilities = ["list", "create", "read", "update", "delete"]
}



path "kv/developers/ansible/data/*"{
capabilities = ["create", "read", "update", "delete"]
}


path "kv/developers/ansible/delete/*"{
capabilities = ["delete", "update"]
}

```



`vault policy -help`


 This command groups subcommands for interacting with policies.
  Users can write, read, and list policies in Vault.

  List all enabled policies:

      $ vault policy list

  Create a policy named "my-policy" from contents on local disk:

      $ vault policy write my-policy ./my-policy.hcl

  Delete the policy named my-policy:

      $ vault policy delete my-policy

  Please see the individual subcommand help for detailed usage information.

Subcommands:
    delete    Deletes a policy by name
    fmt       Formats a policy on disk
    list      Lists the installed policies
    read      Prints the contents of a policy
    write     Uploads a named policy from a file




