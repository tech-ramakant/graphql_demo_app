# graphql_demo_app


## REST in Peace: Star Wars Meets GraphQL + Flutter! 🚀🌌

Hello there, fellow Flutter and GraphQL explorers! 👋

This repository contains the source code for the tutorial **[REST in Peace: Star Wars Meets GraphQL + Flutter!](https://medium.com/@tech.ramakant/rest-in-peace-star-wars-meets-graphql-flutter-54c1e11e8f7f)** published on Medium. It demonstrates how to integrate GraphQL with Flutter while building a fun and informative Star Wars app! 🛸✨

## Table of Contents
- [Overview](#Overview)
- [Features](#Features)
- [Installation](#Installation)
- [Usage](#Usage)
- [Contributing](#Contributing)
- [License](#License)
- [Contact](#Contact)

## Overview
Tired of over-fetching or under-fetching data with REST APIs? 🚫 Say hello to GraphQL, the cool kid on the block that fetches only the data you need in a single request. This project is a Star Wars-themed Flutter app showcasing how GraphQL makes API consumption smarter and more efficient.

Dive into the code to see how GraphQL queries, mutations, and schema play nicely with Flutter.

This is the accompanying code for my [article](https://medium.com/@tech.ramakant/rest-in-peace-star-wars-meets-graphql-flutter-54c1e11e8f7f) where we break down GraphQL basics, advantages over REST, and Flutter integration step by step. 🚀

## Features
- **GraphQL Queries and Mutations**: Fetch only what you need or send data efficiently.
- **Star Wars API Integration**: Explore the galaxy through the Star Wars API (SWAPI) 🌌.
- **Beginner-Friendly**: Step-by-step implementation with easy-to-follow examples.
- **Scalable Codebase**: Designed with clean architecture principles in mind.

## Installation
1. Clone the repository:

    ```bash
    git clone https://github.com/tech-ramakant/graphql_demo_app.git
    ```

2. Navigate to the project directory:

    ```bash
    cd graphql_demo_app
    ```

3. Install the dependencies:

    ```bash
    flutter pub get
    ```

4. Run the app:

    ```bash
    flutter run
    ```

## Usage
Explore the code in the lib/ folder to see how GraphQL queries and mutations are implemented. 
Here's a small taste:

Example Query:
```dart
const String fetchStarships = r'''
query {
  allStarships {
    starships {
      name
      model
    }
  }
}
''';

final result = await client.query(QueryOptions(document: gql(fetchStarships)));
final starships = result.data?['allStarships']['starships'];

```

Example Mutation:
```dart
const String addReview = r'''
mutation($episode: Episode!, $review: ReviewInput!) {
  createReview(episode: $episode, review: $review) {
    stars
    commentary
  }
}
''';

final result = await client.mutate(MutationOptions(
document: gql(addReview),
variables: {
'episode': 'NEWHOPE',
'review': {'stars': 5, 'commentary': 'This app is out of this world!'}
},
));

```

## Contributing
Feel free to open issues or make pull requests to improve this project. Contributions are always welcome!

Fork the repo
- Create your branch: git checkout -b my-new-feature
- Commit your changes: git commit -am 'Add some feature'
- Push to the branch: git push origin my-new-feature
- Submit a pull request

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Contact
For any inquiries, feel free to reach out to me via:

- Email: [tech.ramakanttiwari@gmail.com](mailto:tech.ramakanttiwari@gmail.com)
- Medium: [@tech.ramakant](https://medium.com/@tech.ramakant)
- LinkedIn: [@tech-ramakant](https://www.linkedin.com/in/tech-ramakant/)
- YouTube: [@Tech.Ramakant](https://www.youtube.com/@Tech.Ramakant)

