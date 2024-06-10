# Github Users

This project consumes github rest api's to perform following functionalities

- [Fetch github users](https://docs.github.com/en/rest/users/users?apiVersion=2022-11-28#list-users)
- [Fetch & preview user details](https://docs.github.com/en/rest/users/users?apiVersion=2022-11-28#get-a-user) and [user repositories](https://docs.github.com/en/rest/repos/repos?apiVersion=2022-11-28#list-repositories-for-a-user)
- Preview User repositories in a webview

### Folder structure

This project uses MVVM Architecture i.e Model View ViewModel, also follows various design principles such as Protocol oriented programming & Solid principles

.
├── Common
├── Model
├── Preview Content
├── Service
├── View
├── ViewModel

### Package dependencies & third party libraries

The project Uses following package dependencies

- SDWebImageSwiftUI - SDWebImageSwiftUI is a SwiftUI image loading framework, which based on SDWebImage.

### How to Configure

To configure this project Navigate to *Github Users/Service/Constant/EnviourmentConstants*

Replace the authToken value with a valid github access token
