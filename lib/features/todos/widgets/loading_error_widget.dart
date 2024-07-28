import 'package:flutter/material.dart';
import 'package:provider_todo_list/shared/widgets/texts/text_widget.dart';

class LoadingErrorWidget extends StatelessWidget {
  const LoadingErrorWidget({
    required this.isLoading,
    required this.error,
    required this.loadTodosAndDoneTodos,
    super.key,
  });

  final bool isLoading;
  final String? error;
  final void Function() loadTodosAndDoneTodos;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoading
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  error!,
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: loadTodosAndDoneTodos,
                  child: const Text(
                    'Tentar novamente',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
    );
  }
}
