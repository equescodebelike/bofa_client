import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_list/user_list_barrel.dart';
import '../data/dto/user_dto.dart';
import 'user_detail_screen.dart';
import 'user_form_screen.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch users when the screen is initialized
    context.read<UserListBloc>().add(const FetchUserList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: BlocBuilder<UserListBloc, UserListState>(
        builder: (context, state) {
          if (state is UserListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserListLoaded) {
            return _buildUserList(state.users.users);
          } else if (state is UserListError) {
            return Center(
              child: Text(
                'Error: ${state.message}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            return const Center(
              child: Text('No users available'),
            );
          }
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Navigate to create user screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserFormScreen(),
                ),
              ).then((_) {
                // Refresh users when returning from form
                context.read<UserListBloc>().add(const FetchUserList());
              });
            },
            heroTag: 'createUser',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              // Refresh users
              context.read<UserListBloc>().add(const FetchUserList());
            },
            heroTag: 'refreshUsers',
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }

  Widget _buildUserList(List<UserDTO> users) {
    if (users.isEmpty) {
      return const Center(
        child: Text('No users found'),
      );
    }

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: user.imageUrl != null && user.imageUrl!.isNotEmpty
                  ? NetworkImage(user.imageUrl!)
                  : null,
              child: user.imageUrl == null || user.imageUrl!.isEmpty
                  ? const Icon(Icons.person)
                  : null,
            ),
            title: Text(user.name),
            subtitle: Text(user.email),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    // Show delete confirmation dialog
                    _showDeleteConfirmationDialog(user);
                  },
                ),
              ],
            ),
            onTap: () {
              // Navigate to user details screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailScreen(
                    userId: user.userId!,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(UserDTO user) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete User'),
        content: Text('Are you sure you want to delete ${user.name}?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<UserListBloc>().add(DeleteUserFromList(user.userId!));
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
