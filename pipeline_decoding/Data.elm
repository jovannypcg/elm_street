module Data exposing (..)


singleUserJson : String
singleUserJson =
    """
    {
        "data": {
            "_id": "576413b1e132c00b0458bd08",
            "first_name": "Mateo",
            "last_name": "Hernández",
            "birthdate": "1987-08-15T06:00:00.000Z",
            "email": "mateohr@gmail.com",
            "username": "mateohr",
            "role": {
                "isDesigner": false,
                "isCustomer": true,
                "isAdmin": false
            },
            "favorites": [1, 2, 3],
            "status": "ACTIVE",
            "picture": "",
            "created_at": "2016-06-17T15:13:53.001Z"
        }
    }
    """


usersJson : String
usersJson =
    """
    {
        "data": [
            {
                "_id": "576413b1e132c00b0458bd08",
                "first_name": "Mateo",
                "email": "mateohr@gmail.com",
                "username": "mateohr",
                "role": {
                    "isDesigner": false,
                    "isCustomer": true
                },
                "favorites": [],
                "status": "ACTIVE",
                "created_at": "2016-06-17T15:13:53.001Z",
                "links": {
                    "self": "http://127.0.0.1:3000/v1/customers/57641d33e132c00b0458bd09"
                }
            },
            {
                "_id": "57641d33e132c00b0458bd09",
                "first_name": "Jovanny Pablo",
                "email": "jovannypcg@gmail.com",
                "username": "mateohr",
                "role": {
                    "isDesigner": false,
                    "isCustomer": true
                },
                "favorites": [],
                "status": "ACTIVE",
                "created_at": "2016-06-17T15:54:27.240Z",
                "links": {
                    "self": "http://127.0.0.1:3000/v1/customers/57641d33e132c00b0458bd09"
                }
            }
        ]
    }
    """
