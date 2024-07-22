import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nana_mobile_task/features/products/presentation/cubit/products_cubit.dart';
import 'package:nana_mobile_task/features/products/presentation/cubit/products_state.dart';
import '/core/utils/resources/resources_exporter.dart';
import '/core/utils/shared_widgets/main_scaffold.dart';


class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            StringsManager.products,
            style: TextStyleManager.screenTitle,
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: 
            Column(
              children: [

                Container(
                  width: 50, height: 100,
                  color: Colors.red,),

          

                   BlocBuilder<ProductsCubit, ProductsStateBase>(
                    builder: (context, state) {
                      if(state is ProductsState) {
                         log("Data is ${state.productsData ?? "No Data"}");
                        return Container(
                        width: 250, height: 250,
                        color: Colors.blue,
                        child:  Text("Data is ${state.productsData?.results?[0].id ?? "No Data"}", 
                        style:  const TextStyle(
                          color: Colors.black
                        ),),
                      );
                      }
                      return const SizedBox();

                    },
                  ),
              ],
            )
          ),
        ),
      ),
    );
  }
}

/*
              
              
                  BlocBuilder<ProductsCubit, ProductsStates>(
                    builder: (context, state) {
                      return AppForm(
                        type: TextInputType.emailAddress,
                      //  controller: context.read<ProductsCubit>().emailController,
                        error: StringsManager.emailIsRequired,
                        textInputAction: TextInputAction.next,
                      );
                    },
                  ),
                  20.00.heightSpace,
                  Text(
                    StringsManager.password,
                    style: TextStyleManager.screenBodySmall,
                  ),
                  10.00.heightSpace,
                  BlocBuilder<ProductsCubit, ProductsStates>(
                    builder: (context, state) {
                      return AppForm(
                        type: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        isPassword: true,
                        controller:
                            context.read<ProductsCubit>().passwordController,
                        error: StringsManager.passwordIsRequired,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return StringsManager.passwordIsRequired;
                          }
                          return null;
                        },
                      );
                    },
                  ),
      
                  BlocConsumer<ProductsCubit, ProductsStates>(
                    listener: (context, state) {
                      if (state is ProductsState) {
                        switch (state.callStatus) {
                          case CallStatus.error:
                            designToastDialog(
                              context: context,
                              toast: Toast.error,
                              message: state.pro ??
                                  StringsManager.anErrorOccurred,
                            );
                            break;
                          case CallStatus.loaded:
                          //  context.read<HomeCubit>().getProfile();

                            navigateAndFinish(
                              context,
                              RouteManager.products,
                            );
                            designToastDialog(
                              context: context,
                              toast: Toast.success,
                              message: StringsManager.loginSuccess,
                            );

                            break;
                          default:
                        }
                      }
                    },
                    builder: (context, state) => AppButton(
                      isLoading: state is ProductsState &&
                          state.callStatus == CallStatus.loading,
                      text: StringsManager.login,
                      isUpperCase: false,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<ProductsCubit>().login();
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StringsManager.doNotHaveAccount,
                        style: TextStyleManager.screenBodySmall,
                      ),
                      SilentTextButton(
                        label: StringsManager.register,
                        onTap: () {
                          navigateTo(
                            context,
                            RouteManager.products,
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
         
*/