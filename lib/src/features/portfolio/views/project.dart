import 'package:assign/src/features/portfolio/views/widgets/project_card.dart';
import 'package:assign/src/models/project_model.dart';
import 'package:flutter/material.dart';

class ProjectsTab extends StatefulWidget {
  const ProjectsTab({super.key});

  @override
  State<ProjectsTab> createState() => _ProjectsTabState();
}

class _ProjectsTabState extends State<ProjectsTab> {
  int _index = 0;

  final List<Project> projects = [
    Project(
      title: 'Kemampuan Merangkum Tulisan',
      category: 'BAHASA SUNDA',
      imageUrl:
          'https://i.postimg.cc/B6mM9bzW/bd676c6a35faff3a958454597de5b3e3.jpg',
      badge: 'A',
    ),
    Project(
      title: 'Kemampuan Merangkum Tulisan',
      category: 'BAHASA SUNDA',
      imageUrl:
          'https://i.postimg.cc/B6mM9bzW/bd676c6a35faff3a958454597de5b3e3.jpg',
      badge: 'A',
    ),
    Project(
      title: 'Kemampuan Merangkum Tulisan',
      category: 'BAHASA SUNDA',
      imageUrl:
          'https://i.postimg.cc/B6mM9bzW/bd676c6a35faff3a958454597de5b3e3.jpg',
      badge: 'A',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopBar(
          selectedIndex: _index,
          onTabSelected: (index) {
            setState(() {
              _index = index;
            });
          },
        ),
        Expanded(
          child: _buildTabContent(),
        ),
      ],
    );
  }

  Widget _buildTabContent() {
    switch (_index) {
      case 0:
        return Column(
          children: [
            SizedBox(
              height: 50,
              width: MediaQuery.sizeOf(context).width * 0.95,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.red,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (value) {
                    print('Search input: $value');
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  final project = projects[index];
                  return ProjectCard(
                    project: project,
                    height: MediaQuery.sizeOf(context).height * 0.14,
                  );
                },
              ),
            ),
          ],
        );

      case 1:
        return const Center(child: Text('Saved Projects will appear here'));
      case 2:
        return const Center(child: Text('Shared Projects will appear here'));
      case 3:
        return const Center(child: Text('Achievements will appear here'));
      default:
        return const Center(child: Text('Home'));
    }
  }
}

class TopBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const TopBar(
      {super.key, required this.selectedIndex, required this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TabBarItem(
          title: 'Home',
          selected: selectedIndex == 0,
          onTap: () => onTabSelected(0),
        ),
        TabBarItem(
          title: 'Saved',
          selected: selectedIndex == 1,
          onTap: () => onTabSelected(1),
        ),
        TabBarItem(
          title: 'Shared',
          selected: selectedIndex == 2,
          onTap: () => onTabSelected(2),
        ),
        TabBarItem(
          title: 'Achievement',
          selected: selectedIndex == 3,
          onTap: () => onTabSelected(3),
        ),
      ],
    );
  }
}

class TabBarItem extends StatelessWidget {
  final String title;
  final bool selected;
  final Function onTap;

  const TabBarItem(
      {super.key,
      required this.title,
      required this.selected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: selected ? Colors.red : Colors.black,
        ),
      ),
    );
  }
}
