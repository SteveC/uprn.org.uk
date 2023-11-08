# Pin npm packages by running ./bin/importmap

pin "application", preload: true

# Replace the following URLs with the ones you are using from the CDN if they provide ES Module versions.
pin "jquery", to: "https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.js"
pin "bootstrap", to: "https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
