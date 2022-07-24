import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectindex = 0;
  FocusNode focusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();
  String? _selectedfood;

  final List<String> _foods = [
    'chinies burani',
    'burger',
    'burani',
    'Special Coffee',
    'Special drink',
    'Fries Chikken'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          size: 30,
          color: Colors.black,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                size: 30,
                color: Colors.black,
              ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              _selectindex = value;
            });
          },
          currentIndex: _selectindex,
          selectedItemColor: const Color(0xffff4a01),
          showUnselectedLabels: true,
          unselectedItemColor: const Color(0xffababab),
          elevation: 22,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: ''),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.window_rounded,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: ''),
          ]),
      body: Column(children: [
        Expanded(
          flex: 40,
          child: Container(
            decoration: const BoxDecoration(
                color: Color(0xffe5e5e5),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            child: Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Spacer(
                          flex: 5,
                        ),
                        Expanded(
                          flex: 90,
                          child: Autocomplete<String>(
                            fieldViewBuilder: (BuildContext context,
                                    textEditingController,
                                    focusNode,
                                    VoidCallback onFieldSubmitted) =>
                                TextField(
                              onSubmitted: (String value) {
                                onFieldSubmitted();
                              },
                              focusNode: focusNode,
                              controller: textEditingController,
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 5,
                                          style: BorderStyle.solid)),
                                  hintText: 'Search Food Here',
                                  hintStyle: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    size: 30,
                                    color: Colors.black,
                                  )),
                            ),
                            optionsBuilder: (TextEditingValue value) {
                              if (value.text.isEmpty) {
                                return [];
                              }
                              return _foods.where((animal) => animal
                                  .toLowerCase()
                                  .contains(value.text.toLowerCase()));
                            },
                            onSelected: (value) {
                              setState(() {
                                _selectedfood = value;
                              });
                            },
                          ),
                        ),
                        const Spacer(
                          flex: 5,
                        )
                      ],
                    ),
                  ],
                ),
                const Positioned(
                  top: 100,
                  left: 40,
                  bottom: 30,
                  right: 40,
                  child: CircleAvatar(
                      foregroundImage: AssetImage('assets/chines.jpg')),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 60,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    const Spacer(
                      flex: 35,
                    ),
                    Expanded(
                        flex: 30,
                        child: Container(
                          height: 10,
                          decoration: const BoxDecoration(
                              color: Color(0xffff4a01),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                        )),
                    const Spacer(
                      flex: 35,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Spacer(
                      flex: 5,
                    ),
                    const Expanded(
                        flex: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image(
                            image: AssetImage('assets/fries.webp'),
                            fit: BoxFit.cover,
                          ),
                        )),
                    const Spacer(
                      flex: 5,
                    ),
                    Expanded(
                      flex: 55,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Fries Chikken',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30)),
                          Text(
                              'Fried chicken has been described as being "crunchy" and "juicy", as well as "crispy". '),
                          Text(
                            '\$15.00',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 5,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Spacer(
                      flex: 5,
                    ),
                    const Expanded(
                        flex: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image(
                            image: AssetImage('assets/special drink.jpg'),
                            fit: BoxFit.cover,
                          ),
                        )),
                    const Spacer(
                      flex: 5,
                    ),
                    Expanded(
                      flex: 55,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Special Drink',
                            style: TextStyle(color: Colors.black, fontSize: 30),
                          ),
                          Text(
                              'Drinking a carton of bacteria is hardly one of the world,s most marketable activities, '),
                          Text(
                            '\$20.00',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 5,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Spacer(
                      flex: 5,
                    ),
                    const Expanded(
                        flex: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image(
                            image: AssetImage('assets/special coffe.jpg'),
                            fit: BoxFit.cover,
                          ),
                        )),
                    const Spacer(
                      flex: 5,
                    ),
                    Expanded(
                      flex: 55,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Special Coffee',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30)),
                          Text(
                              'Typically, speciality coffee is grown at high altitudes, with much care and attention from the farmer. '),
                          Text(
                            '\$20.00',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 5,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Spacer(
                      flex: 5,
                    ),
                    const Expanded(
                        flex: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image(
                            image: AssetImage('assets/burger1.jpg'),
                            fit: BoxFit.cover,
                          ),
                        )),
                    const Spacer(
                      flex: 5,
                    ),
                    Expanded(
                      flex: 55,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Special Burger',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30)),
                          Text(
                              'A huge single or triple burger  fixings, cheese,  tomato, onions and special sauce. '),
                          Text(
                            '\$10.00',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 5,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Spacer(
                      flex: 5,
                    ),
                    const Expanded(
                        flex: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image(
                            image: AssetImage('assets/fries.webp'),
                            fit: BoxFit.cover,
                          ),
                        )),
                    const Spacer(
                      flex: 5,
                    ),
                    Expanded(
                      flex: 55,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Fries Chikken',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30)),
                          Text(
                              'Fried chicken has been described as being "crunchy" and "juicy", as well as "crispy".  '),
                          Text(
                            '\$15.00',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 5,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Spacer(
                      flex: 5,
                    ),
                    const Expanded(
                        flex: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image(
                            image: AssetImage('assets/special drink.jpg'),
                            fit: BoxFit.cover,
                          ),
                        )),
                    const Spacer(
                      flex: 5,
                    ),
                    Expanded(
                      flex: 55,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Special Drink',
                            style: TextStyle(color: Colors.black, fontSize: 30),
                          ),
                          Text(
                              'Drinking a carton of bacteria is hardly one of the world,s most marketable activities.'),
                          Text(
                            '\$20.00',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 5,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Spacer(
                      flex: 5,
                    ),
                    const Expanded(
                        flex: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image(
                            image: AssetImage('assets/special coffe.jpg'),
                            fit: BoxFit.cover,
                          ),
                        )),
                    const Spacer(
                      flex: 5,
                    ),
                    Expanded(
                      flex: 55,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Special Coffee',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30)),
                          Text(
                              'Typically, speciality coffee is grown at high altitudes, with much care and attention from the farmer. '),
                          Text(
                            '\$20.00',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 5,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Spacer(
                      flex: 5,
                    ),
                    const Expanded(
                        flex: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image(
                            image: AssetImage('assets/burger1.jpg'),
                            fit: BoxFit.cover,
                          ),
                        )),
                    const Spacer(
                      flex: 5,
                    ),
                    Expanded(
                      flex: 55,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Special Burger',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30)),
                          Text(
                              'A huge single or triple burge fixings, cheese, lettuce, tomato, onions and special sauce.'),
                          Text(
                            '\$10.00',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 5,
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
