import 'package:androidstudio/shares/colors.dart';
import 'package:androidstudio/shares/configs.dart';
import 'package:flutter/material.dart';

late BuildContext _context;

class HeaderView extends StatefulWidget {
  const HeaderView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _headerView();
}

class _headerView extends State<HeaderView> {
  @override
  Widget build(BuildContext context) {
    _context = context;
    return Row(
      children: [
        Text(
          'FREESHIP',
          style: Theme.of(context).textTheme.headline1,
        ),
        const Text(
          '+',
          style: TextStyle(
            fontSize: 18,
            color: Colors.amber,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.62,
          child: Image.asset(
            'assets/images/tiki.png',
            width: 35,
            height: 35,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}

Widget searchBox() {
  return AppBar(
    backgroundColor: Colors.white,

    actions: [
      IconButton(
        splashRadius: 25,
        onPressed: () {
          // method to show the search bar
          showSearch(
              context: _context,
              // delegate to customize the search bar
              delegate: CustomSearchDelegate());
        },
        icon: const Icon(Icons.search, color: MColors.app),
      )
    ],
  );
}

class CustomSearchDelegate extends SearchDelegate {
// Demo list to show querying
  List<String> searchTerms = ["Apple", "Banana", "Mango", "Pear", "Watermelons", "Blueberries", "Pineapples", "Strawberries"];

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
