# Comphanny CMS `WIP`

## Some Links...
This is the CMS counterpart to the fake Comphanny company I've setup for a CraftCMS demo.

Link to template repo [here](https://github.com/DavinaLeong/proj-comphaanyy-template).

This CMS is created using [CraftCMS](https://craftcms.com/).

Here is my [personal writeup](https://dev.to/davinaleong/introduction-to-craftcms-1n9a) on CraftCMS on [dev.to](https://dev.to/).

![qrcode to craft writeup](./web/images/devto-craft-qrcode.png)


## Setup for **Local** env
1) Clone this [repo](https://github.com/davinaleong/proj-comphanny-cms) on to your local machine.

2) Open up your MySQL client and run the `sql` dump in the `/scripts` folder.

3) Make a copy of the `.env.example` and rename it to `.env`.
    - Update the database variables
    - Security key: `Zk6YSZvl6jWDgCTmhg0UtCoNlZ7MfTpM` (shhhhhh....🤫)
    - Update `DEFAULT_SITE_URL`
    - Add the script below to the bottom of your `.env` file, and update `ASSET_BASE_URL` and `FILE_SYSTEM_PATH`
    - `ASSET_BASE_URL`: localhost url to the `web/uploads` folder
    - `FILE_SYSTEM_PATH`: the path you the `web/uploads` directory on your local dev machine

```
# Asset URLs
ASSET_BASE_URL="//localhost/comphanny-cms/uploads/"
FILE_SYSTEM_PATH="/Users/davina/Developer/proj-comphanny-cms/web/uploads/"

ASSET_BASE_URL_ABOUT="${ASSET_BASE_URL}about/"
FILE_SYSTEM_PATH_ABOUT="${FILE_SYSTEM_PATH}about/"

ASSET_BASE_URL_PRODUCTS="${ASSET_BASE_URL}products/"
FILE_SYSTEM_PATH_PRODUCTS="${FILE_SYSTEM_PATH}products/"

ASSET_BASE_URL_PROFILES="${ASSET_BASE_URL}profiles/"
FILE_SYSTEM_PATH_PROFILES="${FILE_SYSTEM_PATH}profiles/"
```

4) Navigate to `{your.local.doman}/cphy` in your browser to access the Control Panel
  - Username: `comphanny`
  - Reset your password
