import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veloura/features/managment/data/models/product_model.dart';
import 'package:veloura/features/managment/presentation/cubits/management_cubit/management_cubit.dart';
import '../widgets/product_management_card.dart';

class ManagementScreen extends StatefulWidget {
  const ManagementScreen({Key? key}) : super(key: key);

  @override
  State<ManagementScreen> createState() => _ManagementScreenState();
}

class _ManagementScreenState extends State<ManagementScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ManagementCubit>().fetchAllProducts();
    });
  }

  Future<void> _showDeleteDialog(BuildContext context, Product product, int index) async {
    final bool? confirm = await showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) {
        return Dialog(
          backgroundColor: const Color(0xFFFDECEB), 
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.warning_amber_rounded, color: Color(0xFFC62828), size: 40),
                const SizedBox(height: 16),
                const Text('Confirm Deletion?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),
                Text(
                  '"${product.name}" will be permanently removed from the catalog.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade800),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(dialogContext).pop(true),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC62828), 
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                        ),
                        child: const Text('DELETE', style: TextStyle(fontSize: 12)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(dialogContext).pop(false),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black87,
                          side: const BorderSide(color: Colors.grey),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                        ),
                        child: const Text('CANCEL', style: TextStyle(fontSize: 12)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

    if (confirm != true) return;

    if (!mounted) return;

    final cubit = context.read<ManagementCubit>();
    final success = await cubit.deleteProduct(product.id);

    if (!mounted) return;

    if (success) {
      _listKey.currentState?.removeItem(
        index,
        (context, animation) => SizeTransition(
          sizeFactor: animation,
          child: FadeTransition(
            opacity: animation,
            child: ProductManagementCard(product: product, onDelete: () {}),
          ),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle_outline, color: Colors.brown),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('Product Deleted Successfully', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  Text('DATABASE HAS BEEN UPDATED', style: TextStyle(color: Colors.grey, fontSize: 10)),
                ],
              ),
            ],
          ),
          backgroundColor: const Color(0xFFEBE5DB),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F2), 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black87),
        title: const Text('Product Management', style: TextStyle(color: Colors.black87, fontStyle: FontStyle.italic, fontSize: 18)),
        actions: const [Icon(Icons.search, color: Colors.black87), SizedBox(width: 16)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text('CURATED COLLECTION', style: TextStyle(fontSize: 12, color: Colors.blueGrey, fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            const Text('Manage Products', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(width: 40, height: 2, color: Colors.amber.shade200),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<ManagementCubit, ManagementState>(
                builder: (context, state) {
                  if (state is ManagementLoading) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.brown),
                    );
                  } 
                  else if (state is ManagementError) {
                    return Center(
                      child: Text(state.message, style: const TextStyle(color: Colors.red)),
                    );
                  } 
                  else if (state is ManagementSuccess) {
                    final products = state.products;
                    
                    if (products.isEmpty) {
                      return const Center(child: Text('No products available right now.'));
                    }

                    return AnimatedList(
                      key: _listKey,
                      initialItemCount: products.length,
                      itemBuilder: (context, index, animation) {
                        final product = products[index];
                        return SizeTransition(
                          sizeFactor: animation,
                          child: ProductManagementCard(
                            product: product,
                            onDelete: () => _showDeleteDialog(context, product, index),
                          ),
                        );
                      },
                    );
                  }
                  
                  return const Center(child: Text('Initializing...'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}