
import 'package:Grocery_App/GroceryApp/Home/Ui/Ui%20Components/search.dart';
import 'package:Grocery_App/GroceryApp/Home/Ui/screens/all.dart';
import 'package:Grocery_App/GroceryApp/Home/Ui/screens/fruitsAndVegetables.dart';
import 'package:Grocery_App/GroceryApp/Home/Ui/screens/technology.dart';
import 'package:Grocery_App/GroceryApp/Home/Ui/screens/beauty.dart';
import 'package:Grocery_App/GroceryApp/Home/bloc/home_bloc.dart';
import 'package:Grocery_App/GroceryApp/Profile/Profile.dart';
import 'package:Grocery_App/GroceryApp/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  static const String routename = '/home';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitalEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if(state is HomeNavigateToProfileActionState){
          Navigator.pushNamed(context, ProfileScreen.routename,);
        }
      },
      builder: (context, state) { 
        return Scaffold(
          body: Stack(
            children :[
              Container(
              height: 600.0, // Adjust the height as needed
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                   
                    Colors.green,
                     Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                ),
              ),
              ),
              Column(
              spacing: 8.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(9.0, 45.0, 9.0, 9.0),
                  child: Row(
                    children: [
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if(state is AuthenticatedState){
                            return Text(
                              state.user['name'],
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            );
                          }
                          return Text('User', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold));
                        },
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.lightGreen,
                          
                          child: IconButton(
                            onPressed: (){
                              homeBloc.add(HomeProfileNavigateEvent());
                            },
                            icon: Icon(Icons.person, size: 25.0),
                            color: Colors.black,
                          )
                        ),
                      ),
                    ],
                  ),
                ),
                Search(),
                const SizedBox(height: 9.0),
                Expanded(
                  child: DefaultTabController(
                    animationDuration: Duration(seconds: 1),
                    length: 4,
                    child: Column( 
                      children: [
                        TabBar(
                          indicatorColor: Colors.black,
                          labelColor: Colors.black,
                          dividerHeight: 0.6,
                          tabs: [
                            Tab(icon: Image.network('https://img.icons8.com/?size=160&id=tgmqacLfjsi4&format=png',scale: 2.7,)),
                            Tab(icon: Image.network('https://img.icons8.com/?size=160&id=eiswqWDOM6o2&format=png',scale: 2.7,)),
                            Tab(icon: Image.network('https://img.icons8.com/?size=160&id=BN4swBtH71wy&format=png',scale:3.0,)),
                            Tab(icon: Image.network('https://cdn-icons-png.flaticon.com/128/10473/10473353.png',scale:3.0,)),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              AllItems(),
                              Beauty(),
                              Fruitsandvegetables(),
                              Technology(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ],
          ),
        );
      },
    );
  }
}

/*

*/