import 'package:auto_route/auto_route.dart';
import 'package:bofa_client/bloc/product_list/product_list_barrel.dart';
import 'package:bofa_client/bloc/product_detail/product_detail_barrel.dart';
import 'package:bofa_client/data/dto/product_dto.dart';
import 'package:bofa_client/screens/ui_kit/custom_filled_button.dart';
import 'package:bofa_client/theme/app_typography.dart';
import 'package:bofa_client/theme/color_const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class ProductAddScreen extends StatefulWidget {
  final ProductDTO? product;

  const ProductAddScreen({
    super.key,
    this.product,
  });

  @override
  State<ProductAddScreen> createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _unitsController = TextEditingController();
  final _mnStepController = TextEditingController();
  final _costController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _categoryController = TextEditingController();
  final _imageUrlNotifier = ValueNotifier<String>('');

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      _nameController.text = widget.product!.name;
      _emailController.text = widget.product!.email;
      _unitsController.text = widget.product!.units;
      _mnStepController.text = widget.product!.mnStep.toString();
      _costController.text = widget.product!.cost.toString();
      _imageUrlController.text = widget.product!.imageUrl ?? '';
      _imageUrlNotifier.value = widget.product!.imageUrl ?? '';
      _categoryController.text = widget.product!.category ?? '';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _unitsController.dispose();
    _mnStepController.dispose();
    _costController.dispose();
    _imageUrlController.dispose();
    _categoryController.dispose();
    _imageUrlNotifier.dispose();
    super.dispose();
  }

  Future<void> _showImageUrlDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Вставьте ссылку на изображение'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Формат .png 1024 x 1024'),
            const SizedBox(height: 16),
            TextField(
              controller: _imageUrlController,
              decoration: const InputDecoration(
                hintText: 'URL изображения',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () {
              _imageUrlNotifier.value = _imageUrlController.text;
              Navigator.pop(context);
            },
            child: const Text('Сохранить'),
          ),
        ],
      ),
    );
  }

  void _saveProduct() {
    if (!_formKey.currentState!.validate()) return;

    final newProduct = ProductDTO(
      name: _nameController.text,
      email: _emailController.text,
      units: _unitsController.text.isEmpty ? 'шт' :_unitsController.text,
      mnStep: int.tryParse(_mnStepController.text) ?? 1,
      cost: double.tryParse(_costController.text) ?? 0.0,
      userId: null, // TODO: Get actual user ID
      imageUrl: _imageUrlController.text,
      category: _categoryController.text,
    );

    if (widget.product == null) {
      context.read<ProductListBloc>().add(CreateProductInList(newProduct));
    } else {
      context.read<ProductDetailBloc>().add(
            UpdateProductDetail(widget.product!.productId!, newProduct),
          );
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.product == null ? 'Новый продукт' : 'Редактировать продукт',
          style: AppTypography.personalCardTitle,
        ),
        centerTitle: true,
        leading: IconButton(
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.comfortable,
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColor.black,
          ),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          ValueListenableBuilder<String>(
                            valueListenable: _imageUrlNotifier,
                            builder: (context, url, _) {
                              return CachedNetworkImage(
                                height: 273,
                                width: 273,
                                imageUrl: url,
                                progressIndicatorBuilder: (_, __, ___) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                                errorWidget: (_, __, ___) {
                                  return Image.asset(
                                    'assets/image/empty_photo.png',
                                  );
                                },
                              );
                            },
                          ),
                          GestureDetector(
                            onTap: _showImageUrlDialog,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: SvgPicture.asset('assets/svg/add.svg'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Информация о продукте',
                    style: AppTypography.personalCardTitle,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Название продукта',
                      hintStyle: const TextStyle(color: AppColor.grey),
                      filled: true,
                      fillColor: const Color(0xFFF0F0F0),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      errorStyle: const TextStyle(color: Colors.red),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Пожалуйста, введите название продукта';
                      }
                      return null;
                    },
                  ),
                  // const SizedBox(height: 15),
                  // TextFormField(
                  //   controller: _emailController,
                  //   decoration: InputDecoration(
                  //     hintText: 'Email',
                  //     hintStyle: const TextStyle(color: AppColor.grey),
                  //     filled: true,
                  //     fillColor: const Color(0xFFF0F0F0),
                  //     contentPadding: const EdgeInsets.symmetric(
                  //       vertical: 16,
                  //       horizontal: 16,
                  //     ),
                  //     border: const OutlineInputBorder(
                  //       borderSide: BorderSide.none,
                  //     ),
                  //     errorStyle: const TextStyle(color: Colors.red),
                  //   ),
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Пожалуйста, введите email';
                  //     }
                  //     if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                  //       return 'Пожалуйста, введите корректный email';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _unitsController,
                    decoration: InputDecoration(
                      hintText: 'Шт/Кг',
                      hintStyle: const TextStyle(color: AppColor.grey),
                      filled: true,
                      fillColor: const Color(0xFFF0F0F0),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      errorStyle: const TextStyle(color: Colors.red),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _mnStepController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Минимальный шаг',
                      hintStyle: const TextStyle(color: AppColor.grey),
                      filled: true,
                      fillColor: const Color(0xFFF0F0F0),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      errorStyle: const TextStyle(color: Colors.red),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Пожалуйста, введите минимальный шаг';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Пожалуйста, введите правильное значение';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _costController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Цена, без ₽',
                      hintStyle: const TextStyle(color: AppColor.grey),
                      filled: true,
                      fillColor: const Color(0xFFF0F0F0),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      errorStyle: const TextStyle(color: Colors.red),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Пожалуйста, введите цену';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Пожалуйста, введите правильное значение цены';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _categoryController,
                    decoration: InputDecoration(
                      hintText: 'Категория',
                      hintStyle: const TextStyle(color: AppColor.grey),
                      filled: true,
                      fillColor: const Color(0xFFF0F0F0),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      errorStyle: const TextStyle(color: Colors.red),
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomFilledButton(
                    text: 'Сохранить',
                    onTap: _saveProduct,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
} 