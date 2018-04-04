# sthLDAPTools

**sthLDAPTools** - it is a module, containing two functions for converting SIDs in string format to byte array and vice versa.

It contains following functions:

[**ConvertFrom-sthSID**](#convertfrom-sthsid) — Function for converting string SID into byte array form.

[**ConvertTo-sthSID**](#convertto-sthsid) — Function for converting byte array into string SID.

You can install sthLDAPTools module from PowerShell Gallery:

```
Install-Module sthLDAPTools
```

## How to use it?

### ConvertFrom-sthSID

Convert string SID into a byte array:

```
ConvertFrom-sthSID -SID 'S-1-5-21-1234567890-1234567890-1234567890-1234'
```

---

Convert string SID into byte array using pipeline:

```
'S-1-5-21-1234567890-1234567890-1234567890-1234' | ConvertFrom-sthSID
```

### ConvertTo-sthSID

Get the user_name user object and convert its objectSID property into a string form:

```
$User = [ADSI]"LDAP://CN=user_name,CN=Users,DC=domain_name,DC=com"
ConvertTo-sthSID -ByteArray $User.objectSID
```

---

Get the user_name user object and convert its objectSID property into a string form using pipeline:

```
$User = [ADSI]"LDAP://CN=user_name,CN=Users,DC=domain_name,DC=com"
$User.objectSID | ConvertTo-sthSID
```
