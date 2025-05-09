# CountryLookup iOS Application

## Overview

CountryLookup is an iOS application built with Swift and UIKit, designed to provide a seamless experience for browsing and searching a list of countries fetched from a remote JSON API. The app is built following the Model-View-ViewModel (MVVM) architecture for a clean and testable codebase, making it scalable and maintainable.

## Key Features

* Fetch country data from a remote JSON API.
* Real-time search by country name or capital city.
* Modular architecture with clear separation of concerns (MVVM).
* Dynamic Type support for improved accessibility.
* Universal app with support for both iPhone and iPad.
* Multi-orientation support (Portrait and Landscape).
* rotocol-oriented programming for flexibility and testability.
* Swift Concurrency (async/await) for efficient asynchronous operations.

## Project Structure

```
CountryLookup/
├── Networking/
│   └── NetworkManager.swift
├── Models/
│   └── Country.swift
├── Views/
│   └── CountryTableViewCell.swift
├── ViewModels/
│   └── CountryViewModel.swift
├── Controllers/
│   └── CountryViewController.swift
```

## 📦 Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/sid-pandya/CountryLookUp
   cd CountryLookup
   ```
2. Open `CountryLookup.xcodeproj` in Xcode.
3. Build and run the app on an iOS Simulator or a physical device.

## Usage

* Launch the app.
* Browse the list of countries.
* Use the search bar to filter countries by name or capital.

## API Source

* Countries are fetched from:

  * [Countries JSON API](https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json)

## App Demo

* iPhone (Portrait and Landscape)


* iPad (Portrait and Landscape)

## Technologies Used

* Swift (UIKit)
* MVVM Architecture
* Auto Layout (Dynamic Cell Height)
* Swift Concurrency (async/await)
* Protocol-Oriented Programming

## 👨‍💻 Author

* Sidhdharth Pandya
* GitHub: [yourusername](https://github.com/sid-pandya)
