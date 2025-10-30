Experiment 11: Fetch Data from Public REST API and Display Results in the App

Aim
To build a mobile app that fetches motivational quotes from a Public REST API (Public API), parses JSON data into app models, and displays the results in a scrollable grid layout with proper loaded, empty, and error states.

## Software Requirements
Flutter SDK
Android Studio / VS Code
Dart SDK
Internet connection
Pexels API key

## Hardware Requirements
Android mobile phone or emulator
Computer/Laptop with internet connectivity

Theory

A REST API (Representational State Transfer Application Programming Interface) allows communication between applications over the internet using HTTP requests.
The Pexels API provides free access to high-quality motivational quote images and related data in JSON format.

In this experiment, the app performs the following steps:
Sends a GET request to the Pexels API.
Parses the JSON response into Dart model classes.
Displays fetched data using GridView widgets in Flutter.
Handles different UI states:
Loading: Data is being fetched.
Empty: No results available.
Error: API request failed or invalid response.

## Procedure

1] Create a new Flutter project:
flutter create quotes_api_app

2] Get a Pexels API key:

Visit https://www.pexels.com/api
Sign up and generate an API key for free access.

3] Add dependencies in pubspec.yaml:

dependencies:
  flutter:
    sdk: flutter
  http: ^latest_version


4] Create a model class to store quote or image data:

class Quote {
  final String photographer;
  final String imageUrl;

  Quote({required this.photographer, required this.imageUrl});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      photographer: json['photographer'],
      imageUrl: json['src']['medium'],
    );
  }
}


5] Fetch data from API using the HTTP package:

final response = await http.get(
  Uri.parse('https://api.pexels.com/v1/search?query=motivational+quotes'),
  headers: {'Authorization': 'YOUR_PEXELS_API_KEY'},
);


6] Parse the JSON response and convert it to a list of Quote objects.

Display data in a GridView:

If data loads successfully → Show images or quotes.
If empty → Show “No results found.”
If error occurs → Show “Failed to fetch data.”
While loading → Show a progress indicator.

7] Run the app:

flutter run

## Expected Output

On launching the app, a loading indicator appears while fetching data.
Once loaded, the app displays motivational quote images from the Pexels API in a scrollable grid format.
If no data is returned, an empty state message is shown.
In case of network or API failure, an error message appears on the screen.

A Flutter application was successfully developed that fetches motivational quotes from the zenquotes Public REST API, parses the received JSON data, and displays it in a responsive grid layout with proper loading, empty, and error states.
