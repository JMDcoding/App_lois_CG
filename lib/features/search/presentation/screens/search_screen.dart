import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  final List<String> _suggestions = [];

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          focusNode: _focusNode,
          onChanged: _onSearch,
          decoration: InputDecoration(
            hintText: 'Rechercher une loi, un droit...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: AppColors.grey500),
          ),
        ),
        actions: [
          if (_controller.text.isNotEmpty)
            IconButton(
              onPressed: () => setState(() { _controller.clear(); _suggestions.clear(); }),
              icon: const Icon(Icons.clear_rounded),
            ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.mic_rounded)),
        ],
      ),
      body: _controller.text.isEmpty
          ? _buildRecentSearches(isDark)
          : _buildResults(isDark),
    );
  }

  Widget _buildRecentSearches(bool isDark) {
    final recent = ['Droit du travail', 'Passeport', 'CrÃ©ation d\'entreprise', 'Arrestation'];
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Recherches populaires', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8, runSpacing: 8,
          children: recent.map((r) => ActionChip(
            label: Text(r),
            onPressed: () { _controller.text = r; _onSearch(r); },
          )).toList(),
        ),
        const SizedBox(height: 24),
        Text('CatÃ©gories', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
        const SizedBox(height: 12),
        ...[
          _buildCategoryTile('Travail', Icons.work_outline_rounded),
          _buildCategoryTile('Famille', Icons.family_restroom_rounded),
          _buildCategoryTile('Justice', Icons.gavel_rounded),
          _buildCategoryTile('Entreprises', Icons.business_center_outlined),
        ],
      ],
    );
  }

  Widget _buildResults(bool isDark) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: Icon(Icons.article_outlined, color: AppColors.forestGreen),
            title: Text('RÃ©sultat pour "${_controller.text}" (${index + 1})',
                style: const TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text('Description du rÃ©sultat de recherche...',
                style: TextStyle(fontSize: 12, color: AppColors.grey500)),
            trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
            onTap: () {},
          ),
        );
      },
    );
  }

  Widget _buildCategoryTile(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: AppColors.forestGreen),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
      onTap: () {},
    );
  }

  void _onSearch(String query) {
    setState(() {});
  }
}
