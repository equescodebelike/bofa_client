import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_detail/user_detail_barrel.dart';
import '../data/dto/user_dto.dart';
import 'user_form_screen.dart';

class UserDetailScreen extends StatelessWidget {
  final int userId;

  const UserDetailScreen({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    // Fetch the user details when the screen is built
    context.read<UserDetailBloc>().add(FetchUserDetail(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: BlocBuilder<UserDetailBloc, UserDetailState>(
        builder: (context, state) {
          if (state is UserDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserDetailLoaded) {
            return _buildUserDetails(context, state.user);
          } else if (state is UserDetailError) {
            return Center(
              child: Text(
                'Error: ${state.message}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            return const Center(
              child: Text('User not found'),
            );
          }
        },
      ),
    );
  }

  Widget _buildUserDetails(BuildContext context, UserDTO user) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User image
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: user.imageUrl != null && user.imageUrl!.isNotEmpty
                  ? NetworkImage(user.imageUrl!)
                  : null,
              child: user.imageUrl == null || user.imageUrl!.isEmpty
                  ? const Icon(Icons.person, size: 60)
                  : null,
            ),
          ),
          const SizedBox(height: 24),
          
          // User name
          Text(
            user.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          
          // User email
          Row(
            children: [
              const Icon(Icons.email, color: Colors.grey),
              const SizedBox(width: 8),
              Text(
                user.email,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
          
          // User phone
          Row(
            children: [
              const Icon(Icons.phone, color: Colors.grey),
              const SizedBox(width: 8),
              Text(
                user.phoneNumber,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
          
          // User status
          Row(
            children: [
              const Icon(Icons.circle, color: Colors.grey),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: user.isActive ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  user.isActive ? 'Active' : 'Inactive',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // User categories
          const Text(
            'Categories:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: user.categories.map((category) {
              return Chip(
                label: Text(category),
                backgroundColor: Colors.blue.shade100,
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          
          // Action buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // Navigate to edit user screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserFormScreen(
                        user: user,
                      ),
                    ),
                  ).then((_) {
                    // Refresh user details when returning from form
                    context.read<UserDetailBloc>().add(FetchUserDetail(user.userId!));
                  });
                },
                icon: const Icon(Icons.edit),
                label: const Text('Edit'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // Toggle user active status
                  final updatedUser = user.copyWith(
                    isActive: !user.isActive,
                  );
                  context.read<UserDetailBloc>().add(
                    UpdateUserDetail(user.userId!, updatedUser),
                  );
                },
                icon: Icon(user.isActive ? Icons.block : Icons.check_circle),
                label: Text(user.isActive ? 'Deactivate' : 'Activate'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: user.isActive ? Colors.red : Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
