# sthLDAPTools

**sthLDAPTools** - это модуль, содержащий две фуркции для конвертации SID из строчного формата в массив байтов и наоборот.

В модуль входят следующие функции:

[**ConvertFrom-sthSID**](#convertfrom-sthsid) — Функция для конвертации строки SID в массив байтов.

[**ConvertTo-sthSID**](#convertto-sthsid) — Функция для конвертации SID, представленного в виде массива байтов, в его строчную форму.

Вы можете установить модуль sthLDAPTools из PowerShell Gallery:

```
Install-Module sthLDAPTools
```

## Как с этим работать?

### ConvertFrom-sthSID

Конвертация строки SID в массив байтов:

```
ConvertFrom-sthSID -SID 'S-1-5-21-1234567890-1234567890-1234567890-1234'
```

---

Конвертация строки SID в массив байтов с использованием конвейера:

```
'S-1-5-21-1234567890-1234567890-1234567890-1234' | ConvertFrom-sthSID
```

### ConvertTo-sthSID

Получение объекта пользователя user_name и конвертация значения его атрибута objectSID в строчную форму.:

```
$User = [ADSI]"LDAP://CN=user_name,CN=Users,DC=domain_name,DC=com"
ConvertTo-sthSID -ByteArray $User.objectSID
```

---

Получение объекта пользователя user_name и конвертация значения его атрибута objectSID в строчную форму с использованием конвейера:

```
$User = [ADSI]"LDAP://CN=user_name,CN=Users,DC=domain_name,DC=com"
$User.objectSID | ConvertTo-sthSID
```
