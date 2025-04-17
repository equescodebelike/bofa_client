import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/cart/cart_barrel.dart';
import '../../../data/dto/cart_item_dto.dart';
import '../../../data/dto/product_dto.dart';
import '../../../data/repository/product_repository.dart';
import '../../../theme/color_const.dart';

class BasketCard extends StatelessWidget {
  const BasketCard({
    Key? key,
    required this.cartItem,
    required this.onTap,
    required this.product,
  }) : super(key: key);

  final CartItemDto cartItem;
  final VoidCallback onTap;
  final ProductDTO product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = cartItem.size;
    final minSize = 1; // Minimum size
    final maxSize = 100; // Maximum size (can be adjusted)

    return ListTile(
      onTap: onTap,
      leading: AspectRatio(
        aspectRatio: 1.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: product.imageUrl ?? '',
            progressIndicatorBuilder: (_, __, ___) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            errorWidget: (_, __, ___) {
              return Image.asset(
                'assets/image/empty_photo.png',
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ),
      title: Text(
        product.name,
        style: theme.textTheme.bodyLarge?.copyWith(
          color: theme.colorScheme.onBackground,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        '\$${product.cost.toStringAsFixed(2)}',
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onBackground,
        ),
      ),
      trailing: SizedBox(
        width: 120,
        child: Row(
          children: [
            Expanded(
              child: IconButton(
                onPressed: size > minSize
                    ? () {
                        context.read<CartBloc>().add(
                              UpdateCartItemSize(
                                cartItem.productId,
                                size - 1,
                              ),
                            );
                      }
                    : null,
                icon: const Icon(
                  Icons.remove,
                  color: AppColor.black,
                ),
              ),
            ),
            Text(
              '$size',
              style: theme.textTheme.bodyMedium,
            ),
            Expanded(
              child: IconButton(
                onPressed: size < maxSize
                    ? () {
                        context.read<CartBloc>().add(
                              UpdateCartItemSize(
                                cartItem.productId,
                                size + 1,
                              ),
                            );
                      }
                    : null,
                icon: const Icon(
                  Icons.add,
                  color: AppColor.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
