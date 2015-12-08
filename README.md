# Ruboty::GoogleImage
An ruboty handler to search images from Google.

## Install

This gem needs two environment variables.

- GOOGLE_CSE_ID
- GOOGLE_CSE_KEY

### CSE setup

1. Create a CSE via these [instructions](https://developers.google.com/custom-search/docs/tutorial/creatingcse).
1. Turn on images in Edit Search Engine > Setup > Basic > Image Search
1. Get the CSE ID in Edit Search Engine > Setup > Basic > Details (via [these instructions](https://support.google.com/customsearch/answer/2649143?hl=en))
1. Get the CSE KEY [here](https://code.google.com/apis/console)
1. Update your env

## Usage
```
@ruboty image <keyword> - Search image from Google
```

![](https://raw.githubusercontent.com/r7kamura/ruboty-google_image/master/images/screenshot.png)
