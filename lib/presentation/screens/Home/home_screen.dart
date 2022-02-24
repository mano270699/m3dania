import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import '../../../constants/components/shammer.dart';
import '../../../constants/network/local/cache_helper.dart';
import '../../../constants/strings.dart';

import 'package:badges/badges.dart';
import '../login/login_screen.dart';
import '../../widget/oreder_dialog.dart';
import '../../../business_logic/shared/app_cubit/app_cubit.dart';
import '../../../business_logic/shared/app_cubit/app_states.dart';
import '../../../constants/components/components.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../data/model/category_model.dart';

class HomeScreen extends StatefulWidget {
  //const OredrScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var searchControler = TextEditingController();

  int catIndex = 0;
  int countNum = 1;
  incrementfun() {
    setState(() {
      countNum++;
    });
  }

  decrementfun() {
    setState(() {
      if (countNum < 1)
        showToast(
            msg: 'You Can\'t decrement less than 1 ', background: Colors.red);
      else
        countNum--;
    });
  }

  @override
  void initState() {
    super.initState();

    AppCubit.get(context)..getAllCategories();
    print(" initState Run");
  }

  late CategoryModel category;

  bool isLoad = false;
  Color selectCategoryColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is CategoriesLoaded) {
          isLoad = true;
          category = (state).category;
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                'App.home'.tr(),
                style: TextStyle(
                  fontFamily: 'Shamel',
                ),
              ),
              centerTitle: true,
              leading: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Badge(
                  position: BadgePosition.topEnd(top: 3, end: 10),
                  animationDuration: Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Text(
                    '${AppCubit.get(context).cartItemCount}',
                    style: TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                      icon: Icon(Icons.shopping_cart),
                      padding: EdgeInsets.only(right: 30.0),
                      onPressed: () {
                        /*var token = CacheHelper.getData(key: 'token');
                        if (token == null) {
                          print("no token : $token");
                          showToast(
                              msg: 'You arn\'t auth ', background: Colors.red);

                          navigateAndFinish(context, LoginScreen());
                        } else {*/
                        Navigator.pushNamed(context, cartPage);
                        // }
                      }),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 10),
                  child: Icon(Icons.notifications_active),
                ),
              ],
            ),
            body: Conditional.single(
                context: context,
                conditionBuilder: (context) => isLoad,
                widgetBuilder: (context) => SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(children: [
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: searchControler,
                            decoration: InputDecoration(
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 10, 10, 0),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                hintText: 'App.search'.tr(),
                                hintStyle: TextStyle(
                                    fontFamily: 'Shamel',
                                    color: Colors.blue[300]),
                                prefixIcon: Icon(Icons.search)),
                            onTap: () {
                              // navigateTo(context, SearchScreen());
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 100,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (context, index) => InkWell(
                                          onTap: () {
                                            if (index == 0) {
                                              setState(() {
                                                catIndex = 0;
                                              });
                                            } else {
                                              for (int i = 1;
                                                  i <= category.data!.length;
                                                  i++) {
                                                if (index == i) {
                                                  setState(() {
                                                    catIndex = i;
                                                  });
                                                }
                                              }
                                            }
                                          },
                                          child: buildCategoryItme(
                                              category, index),
                                        ),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          width: 5,
                                        ),
                                    itemCount: category.data!.length),
                              ),
                              Container(
                                width: double.infinity,
                                child: MediaQuery.removePadding(
                                  removeTop: true,
                                  context: context,
                                  child: ListView.separated(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        String local = 'en';

                                        local = context.locale.toString();
                                        // print('locale: $local');
                                        return buildWaterItem(
                                            context, category, index, local);
                                      },
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                            height: 5,
                                          ),
                                      itemCount: category
                                          .data![catIndex].products!.length),
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ),
                fallbackBuilder: (BuildContext context) => ShimmerList()));
      },
    );
  }

  Widget buildCategoryItme(CategoryModel categoriesModel, int index) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 60,
            width: 60,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              border: Border.all(
                  color:
                      (catIndex == index) ? selectCategoryColor : Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image(
                image: NetworkImage('${categoriesModel.data![index].photo}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '${categoriesModel.data![index].name}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: TextStyle(
              fontFamily: 'Shamel',
              color: (catIndex == index) ? selectCategoryColor : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );

  Widget buildWaterItem(
    context,
    CategoryModel proData,
    int index,
    String local,
  ) =>
      InkWell(
        onTap: () {
          print('object${proData.data![catIndex].products![index].minQty}');
          showDialog(
            barrierColor: Colors.black26,
            barrierDismissible: true,
            context: context,
            builder: (context) {
              return CustomAlertDialog(
                minQty: '${proData.data![catIndex].products![index].minQty}',
                prodectID: proData.data![catIndex].products![index].id!,
              );
            },
          );
        },
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                height: 150,
                width: double.infinity,
                image: NetworkImage(
                    '${proData.data![catIndex].products![index].photo}'),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${proData.data![catIndex].products![index].name}',
                            style: TextStyle(
                                fontFamily: 'Shamel',
                                fontSize: 14,
                                color: Colors.white)),
                        Text(
                            '${proData.data![catIndex].products![index].description}',
                            style: TextStyle(
                                fontFamily: 'Shamel',
                                fontSize: 14,
                                color: Colors.white)),
                      ],
                    ),
                  ),
                  Text(
                    '${proData.data![catIndex].products![index].price} ' +
                        '${identical('$local', 'en') ? 'JOD' : 'دينار'}',
                    style: TextStyle(
                        fontFamily: 'Shamel',
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
