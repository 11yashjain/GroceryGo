import 'dart:async';

import 'package:Grocery_App/Data/cart.dart';
import 'package:Grocery_App/GroceryApp/Cart/Ui/bottomsheet.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeState> {
  
  HomeBloc() : super(HomeBlocInitial()) {
    on<HomeInitalEvent>(homeInitalEvent);
    on<HomeProfileNavigateEvent>(homeProfileNavigateEvent);
    on<HomeToCartEvent>(homeToCartEvent);
    on<HomeCartBottomSheetEvent>(homeCartBottomSheetEvent);
  }

  FutureOr<void> homeInitalEvent(
      HomeInitalEvent event, Emitter<HomeState> emit)  {
    }
    
  FutureOr<void> homeProfileNavigateEvent(
      HomeProfileNavigateEvent event, Emitter<HomeState> emit)  {

        emit(HomeNavigateToProfileActionState());
    }
    
  FutureOr<void> homeToCartEvent(
      HomeToCartEvent event, Emitter<HomeState> emit)  {
       
         cartItems.add(event.data);
              
         

          
    }   

    FutureOr<void> homeCartBottomSheetEvent(
      HomeCartBottomSheetEvent event, Emitter<HomeState> emit)  {
       
        
          
    }    
    
  

 


  
}


 /*
 final productId = event.clickedProduct.id; // Use a more descriptive name

    // Check if the product already exists in the cart using a more efficient approach
    final existingProductIndex =
        cartlistItems.indexWhere((product) => product.id == productId);
    var isproductfound = false;
    if (existingProductIndex != -1) {
      // Product already exists, increase its quantity
      cartlistItems[existingProductIndex].count++;
      // Assuming `count` represents product quantity
    } else {
      cartlistItems.add(event.clickedProduct);
    }
 */