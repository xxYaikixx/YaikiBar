import 'package:flutter/material.dart';

class TabsExample extends StatefulWidget {
  const TabsExample({Key key}) : super(key: key);

  @override
  _TabsExampleState createState() => _TabsExampleState();
}

class _TabsExampleState extends State<TabsExample> {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchText = searchController.value.text;
    final _kTabPages = <Widget>[
      //飲み物リスト
      buildMenu(
        context,
        ['スイカジュース', 'オレンジジュース', '焼酎'],
      ),
      //食べ物リスト
      buildMenu(
        context,
        ['オムライス', '味付け玉子', 'だし巻き玉子', '目玉焼き', '冷やしトマト'].where(
          (element) {
            return searchText.isEmpty || !element.contains(searchText);
          },
        ).toList(),
      ),
    ];
    final _kTabs = <Tab>[
      Tab(
        icon: Icon(Icons.local_bar),
        child: Text('drink お飲み物', style: Theme.of(context).textTheme.headline3),
      ),
      Tab(
        icon: Icon(Icons.restaurant),
        child: Text('food お食事', style: Theme.of(context).textTheme.headline3),
      ),
    ];

    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('居酒屋 やいき', style: Theme.of(context).textTheme.headline2),
          bottom: TabBar(
            tabs: _kTabs,
          ),
        ),
        body: TabBarView(
          children: _kTabPages,
        ),
      ),
    );
  }

  Widget buildMenu(BuildContext context, List<String> menus) {
    return Column(
      children: [
        //Textフィールド
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: searchController,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.blueAccent,
            ),
            //入力された内容をリアルタイムで反映する
            onChanged: (v) {
              setState(() {});
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              prefixIcon: Icon(Icons.block),
              hintText: "苦手な食材・アレルギー食材などを入力してください。",
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.deepOrangeAccent, width: 32.0),
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            textInputAction: TextInputAction.search,
          ),
        ),
        Expanded(
          child: GridView.count(
            childAspectRatio: 8,
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: menus
                .map(
                  (drink) => Card(
                    elevation: 10,
                    color: Colors.yellowAccent[100],
                    child: InkWell(
                      splashColor: Colors.orange,
                      onTap: () {},
                      child: Text(
                        drink,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
