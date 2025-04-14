import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product/product_barrel.dart';
import '../data/dto/product_dto.dart';

class ProductFormScreen extends StatefulWidget {
  final ProductDTO? product;
  final bool isEditing;

  const ProductFormScreen({
    super.key,
    this.product,
  }) : isEditing = product != null;

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _formKey = GlobalKey<FormState>();
  
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _unitsController;
  late final TextEditingController _mnStepController;
  late final TextEditingController _costController;
  late final TextEditingController _imageUrlController;
  
  @override
  void initState() {
    super.initState();
    
    // Initialize controllers with existing product data if editing
    _nameController = TextEditingController(
      text: widget.isEditing ? widget.product!.name : '',
    );
    _emailController = TextEditingController(
      text: widget.isEditing ? widget.product!.email : '',
    );
    _unitsController = TextEditingController(
      text: widget.isEditing ? widget.product!.units.toString() : '',
    );
    _mnStepController = TextEditingController(
      text: widget.isEditing ? widget.product!.mnStep.toString() : '',
    );
    _costController = TextEditingController(
      text: widget.isEditing ? widget.product!.cost.toString() : '',
    );
    _imageUrlController = TextEditingController(
      text: widget.isEditing ? widget.product!.imageUrl ?? '' : '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _unitsController.dispose();
    _mnStepController.dispose();
    _costController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditing ? 'Edit Product' : 'Create Product'),
      ),
      body: BlocListener<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductOperationSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            Navigator.of(context).pop();
          } else if (state is ProductError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                    controller: _unitsController,
                    decoration: const InputDecoration(
                      labelText: 'Units',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter units';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _mnStepController,
                    decoration: const InputDecoration(
                      labelText: 'Minimum Step',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter minimum step';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _costController,
                    decoration: const InputDecoration(
                      labelText: 'Cost',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter cost';
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
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      widget.isEditing ? 'Update Product' : 'Create Product',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final product = ProductDTO(
        productId: widget.isEditing ? widget.product!.productId : null,
        name: _nameController.text,
        email: _emailController.text,
        units: int.parse(_unitsController.text),
        mnStep: int.parse(_mnStepController.text),
        cost: double.parse(_costController.text),
        userId: widget.isEditing ? widget.product!.userId : 1, // Default user ID
        imageUrl: _imageUrlController.text.isEmpty
            ? null
            : _imageUrlController.text,
      );

      if (widget.isEditing) {
        context
            .read<ProductBloc>()
            .add(UpdateProduct(widget.product!.productId!, product));
      } else {
        context.read<ProductBloc>().add(CreateProduct(product));
      }
    }
  }
}
