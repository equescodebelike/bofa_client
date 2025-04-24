import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_list/user_list_barrel.dart';
import '../bloc/user_detail/user_detail_barrel.dart';
import '../data/dto/user_dto.dart';

class UserFormScreen extends StatefulWidget {
  final UserDTO? user;
  final bool isEditing;

  const UserFormScreen({
    super.key,
    this.user,
  }) : isEditing = user != null;

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final _formKey = GlobalKey<FormState>();
  
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _imageUrlController;
  // Removed _isActive field but keeping it in the model
  final List<String> _selectedCategories = [];
  
  final List<String> _availableCategories = [
    'Technology', 'Business', 'Health', 'Education', 
    'Entertainment', 'Sports', 'Science', 'Art'
  ];
  
  @override
  void initState() {
    super.initState();
    
    // Initialize controllers with existing user data if editing
    _nameController = TextEditingController(
      text: widget.isEditing ? widget.user!.name : '',
    );
    _emailController = TextEditingController(
      text: widget.isEditing ? widget.user!.email : '',
    );
    _phoneNumberController = TextEditingController(
      text: widget.isEditing ? widget.user!.phoneNumber : '',
    );
    _imageUrlController = TextEditingController(
      text: widget.isEditing ? widget.user!.imageUrl ?? '' : '',
    );
    // Removed _isActive initialization
    
    if (widget.isEditing && widget.user!.categories != null) {
      _selectedCategories.addAll(widget.user!.categories!);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditing ? 'Edit User' : 'Create User'),
      ),
      body: widget.isEditing
          ? BlocListener<UserDetailBloc, UserDetailState>(
              listener: (context, state) {
                if (state is UserDetailOperationSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                  Navigator.of(context).pop();
                } else if (state is UserDetailError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: _buildForm(),
            )
          : BlocListener<UserListBloc, UserListState>(
              listener: (context, state) {
                if (state is UserListOperationSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                  Navigator.of(context).pop();
                } else if (state is UserListError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: _buildForm(),
            ),
    );
  }

  Widget _buildForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.isEditing && widget.user!.imageUrl != null && widget.user!.imageUrl!.isNotEmpty)
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(widget.user!.imageUrl!),
                ),
              ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a phone number';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _imageUrlController,
              decoration: const InputDecoration(
                labelText: 'Image URL (optional)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.url,
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 16),
            const Text(
              'Categories:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 0,
              children: _availableCategories.map((category) {
                final isSelected = _selectedCategories.contains(category);
                return FilterChip(
                  label: Text(category),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selectedCategories.add(category);
                      } else {
                        _selectedCategories.remove(category);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                widget.isEditing ? 'Update User' : 'Create User',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final user = UserDTO(
        userId: widget.isEditing ? widget.user!.userId : null,
        name: _nameController.text,
        email: _emailController.text,
        phoneNumber: _phoneNumberController.text.isEmpty ? null : _phoneNumberController.text,
        isActive: widget.isEditing ? widget.user!.isActive : true, // Default to true for new users
        imageUrl: _imageUrlController.text.isEmpty
            ? null
            : _imageUrlController.text,
        categories: _selectedCategories.isEmpty ? null : _selectedCategories,
      );

      if (widget.isEditing) {
        context
            .read<UserDetailBloc>()
            .add(UpdateUserDetail(widget.user!.userId!, user));
      } else {
        context.read<UserListBloc>().add(CreateUserInList(user));
      }
    }
  }
}
