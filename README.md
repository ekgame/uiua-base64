# Base64 for Uiua

A robust library for encoding and decoding base64 strings.

## Usage

```uiua
# Import the library
BSF ~ "git: github.com/ekgame/uiua-base64"

# Encode byte array
BSF~Encode [1 2 3 4 5]

# Decode byte array from Base64 string
BSF~Decode "AQIDBAU="

# Encode a UTF-8 string to a Base64 string
BSF~EncodeString "Hello world!"

# Decode a UTF-8 string from Base64 string
BSF~DecodeString "SSDinaQgVWl1YSE="
```

[Try the code in the online editor](https://www.uiua.org/pad?src=0_10_0-dev_1__QlNGIH4gImdpdDogZ2l0aHViLmNvbS9la2dhbWUvdWl1YS1iYXNlNjQiCgojIEVuY29kZSBieXRlIGFycmF5CkJTRn5FbmNvZGUgWzEgMiAzIDQgNV0KCiMgRGVjb2RlIGJ5dGUgYXJyYXkgZnJvbSBCYXNlNjQgc3RyaW5nCkJTRn5EZWNvZGUgIkFRSURCQVU9IgoKIyBFbmNvZGUgYSBVVEYtOCBzdHJpbmcgdG8gYSBCYXNlNjQgc3RyaW5nCkJTRn5FbmNvZGVTdHJpbmcgIkhlbGxvIHdvcmxkISIKCiMgRGVjb2RlIGEgVVRGLTggc3RyaW5nIGZyb20gYQpCU0Z-RGVjb2RlU3RyaW5nICJTU0RpbmFRZ1ZXbDFZU0U9Igo=)

## Notes

Encoding an array requires all the numbers to be integers between 0 and 255 inclusive. This library refers to such an array as a byte array.

## Acknowledgements

- Adapted from an example by floupette and notes from [Kaikalii](https://github.com/kaikalii) on the [Uiua Discord server](https://discord.gg/3r9nrfYhCc).