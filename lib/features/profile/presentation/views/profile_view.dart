import 'package:book_store/features/profile/manager/profile_cubit.dart';
import 'package:book_store/features/profile/manager/profile_state.dart';
import 'package:book_store/features/profile/widget/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return ProfileCubit()..getUserData()..uploadImage();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocConsumer<ProfileCubit, ProfileState>(
              listener: (BuildContext context, ProfileState state) {
                if (state is FieldProfileState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (BuildContext context, ProfileState state) {
                if (state is LoadingProfileState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SuccessProfileState) {
                  ProfileCubit cubit = ProfileCubit.get(context);
                  return Column(
                    children: [
                      // Uncomment and use an actual image URL
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            'https://via.placeholder.com/150'), // Placeholder image URL
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        initialValue: cubit.userModel?.name ?? '',
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        initialValue: cubit.userModel?.email ?? '',
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        initialValue: cubit.userModel?.phone ?? '',
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: 'Phone',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        initialValue: cubit.userModel?.city ?? '',
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: 'City',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        initialValue: cubit.userModel?.address ?? '',
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: 'Address',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const EditProfileScreen()),
                          );
                        },
                        child: const Text('Edit Profile'),
                      ),
                    ],
                  );
                } else if (state is FieldProfileState) {
                  return Center(child: Text('Error: ${state.message}'));
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }
}
