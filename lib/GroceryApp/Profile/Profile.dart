import 'package:Grocery_App/GroceryApp/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  static const String routename = '/Profile';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
   

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(title: Padding(
        padding: const EdgeInsets.only(left: 85.0),
        child: Text('Profile',style:TextStyle(fontSize: 24.0,fontWeight: FontWeight.w400)),
      ),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if(state is AuthenticatedState){
                          return  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.user['name'],
                                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                                ),
                                 SizedBox(height: 8),
                                 Text(
                            state.user['email'],
                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.w200),
                            ),
                            ],
                          );
                          }
                          return Text('Welcome',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold));
                        },
                      ),
              ),
              Divider(thickness: 1.0,),
             
              SizedBox(height: 24),
              _buildProfileOption(Icons.edit, 'Edit Profile', () {
                
              }),
              _buildProfileOption(Icons.shopping_bag, 'My Orders', () {
                
              }),
              _buildProfileOption(Icons.location_on, 'Delivery Addresses', () {
               
              }),
              _buildProfileOption(Icons.help, 'Help & Support', () {
               
              }),
              _buildProfileOption(Icons.exit_to_app, 'Log Out', () {
               
              }, isDestructive: true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title, VoidCallback onTap, {bool isDestructive = false}) {
    return ListTile(
      leading: Icon(icon, color: isDestructive ? Colors.red : null),
      title: Text(title, style: TextStyle(color: isDestructive ? Colors.red : null)),
      onTap: onTap,
    );
  }
}