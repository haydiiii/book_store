import 'package:book_store/features/home/manager/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/home_states.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context,  state) {
          var cubit = HomeCubit.get(context);
          return  cubit.sliderModel.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount:cubit.sliderModel.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    
                    return Container(
                      margin: const EdgeInsets.all(2),
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(cubit.sliderModel[index].image!),
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
