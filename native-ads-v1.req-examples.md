# fluct Native Ads: Native Markup Request Object Examples

* [Icon](#icon)
* [Main](#main)

### Icon

Title (max length 20), icon image (min 160x160), sponsored (max length 30), and description (max length 50).

```json
{
  "assets": [
    {
      "id": 1,
      "required": 1,
      "title": {
        "len": 20
      }
    },
    {
      "id": 2,
      "img": {
        "hmin": 160,
        "type": 1,
        "wmin": 160
      },
      "required": 1
    },
    {
      "data": {
        "len": 30,
        "type": 1
      },
      "id": 3,
      "required": 1
    },
    {
      "data": {
        "len": 50,
        "type": 2
      },
      "id": 4,
      "required": 1
    }
  ],
  "aurlsupport": 0,
  "context": 1,
  "durlsupport": 0,
  "eventtrackers": [
    {
      "event": 1,
      "methods": [
        1
      ]
    }
  ],
  "plcmtcnt": 1,
  "plcmttype": 1,
  "privacy": 1,
  "ver": "1.2"
}
```

### Main

Title (max length 20), main image (min 382x200), sponsored (max length 30), and description (max length 50).

```json
{
  "assets": [
    {
      "id": 1,
      "required": 1,
      "title": {
        "len": 20
      }
    },
    {
      "id": 2,
      "img": {
        "hmin": 200,
        "type": 2,
        "wmin": 382
      },
      "required": 1
    },
    {
      "data": {
        "len": 30,
        "type": 1
      },
      "id": 3,
      "required": 1
    },
    {
      "data": {
        "len": 50,
        "type": 2
      },
      "id": 4,
      "required": 1
    }
  ],
  "aurlsupport": 0,
  "context": 1,
  "durlsupport": 0,
  "eventtrackers": [
    {
      "event": 1,
      "methods": [
        1
      ]
    }
  ],
  "plcmtcnt": 1,
  "plcmttype": 1,
  "privacy": 1,
  "ver": "1.2"
}
```

