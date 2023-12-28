import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget  implements PreferredSizeWidget{
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
/*
    Widget _buildSearchResults() {
      return ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_searchResults[index]),
            // Adicione mais detalhes ou ações conforme necessário.
          );
        },
      );
    }

    return AppBar(
      backgroundColor: const Color.fromARGB(255, 29, 29, 29),
      foregroundColor: colorScheme.onTertiary,
      title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Pesquisar...',
          ),
      onChanged: (query) {
            _performSearch(query);
          },
        ),
      ),
      body: _buildSearchResults(),
    );*/
    
    return AppBar(
        title: const Text('Procurar local'),
        backgroundColor: const Color.fromARGB(255, 29, 29, 29),
        foregroundColor: colorScheme.onTertiary,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
          ),
       ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(60);
}