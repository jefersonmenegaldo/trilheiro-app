import 'package:flutter/material.dart';
import 'package:trilheiro/src/views/search/widgets/app_bar.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  final TextEditingController _searchController = TextEditingController();
  List<String> _searchResults = [];

  void _performSearch(String query) {
    // Simulação de uma busca. Substitua esta lógica pela lógica real de pesquisa.
    List<String> results = ['Resultado 1', 'Resultado 2', 'Resultado 3'];

    setState(() {
      _searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Pesquisar...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                _performSearch(query);
              },
            ),
          ),
          Expanded(
            child: _buildSearchResults(),
          ),
        ],
      ),
    );
  }

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
}