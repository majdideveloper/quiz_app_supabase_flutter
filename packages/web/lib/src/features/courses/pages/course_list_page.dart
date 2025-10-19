import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:common/common.dart' as common;
import '../../../common/widgets/app_navbar.dart';
import '../../../common/widgets/app_footer.dart';
import '../../../common/widgets/responsive_layout.dart';
import '../../../core/utils/responsive_helper.dart';
import '../widgets/course_grid.dart';
import '../widgets/course_sidebar.dart';

/// Page listant tous les cours disponibles avec filtres
class CourseListPage extends StatefulWidget {
  const CourseListPage({super.key});

  @override
  State<CourseListPage> createState() => _CourseListPageState();
}

class _CourseListPageState extends State<CourseListPage> {
  String? _selectedCategory;
  common.CourseLevel? _selectedLevel;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Charger tous les cours au démarrage
    context.read<common.CourseBloc>().add(const common.CourseEvent.loadCourses());
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobileOrTablet(context);

    return Scaffold(
      appBar: const AppNavbar(),
      body: BlocBuilder<common.CourseBloc, common.CourseState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(
              child: Text('Chargement initial...'),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            coursesLoaded: (courses, selectedCategory, selectedLevel, searchQuery) {
              final filteredCourses = _filterCourses(courses);

              return SingleChildScrollView(
                child: Column(
                  children: [
                    // Header
                    _buildHeader(context),

                    // Contenu principal
                    ResponsiveLayout(
                      showSidebar: !isMobile,
                      sidebar: CourseSidebar(
                        onCategoryChanged: (category) {
                          setState(() => _selectedCategory = category);
                        },
                        onLevelChanged: (level) {
                          setState(() => _selectedLevel = level);
                        },
                        onSearchChanged: (query) {
                          setState(() => _searchQuery = query);
                        },
                      ),
                      child: Column(
                        children: [
                          // Filtres mobiles
                          if (isMobile) _buildMobileFilters(),

                          // Grille de cours
                          filteredCourses.isEmpty
                              ? _buildEmptyState()
                              : CourseGrid(courses: filteredCourses),
                        ],
                      ),
                    ),

                    // Footer
                    const AppFooter(),
                  ],
                ),
              );
            },
            courseDetailLoaded: (course) => const Center(
              child: CircularProgressIndicator(),
            ),
            courseLessonsLoaded: (course, lessons) => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (message) => SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeader(context),
                  SizedBox(
                    height: 400,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 64,
                            color: common.AppColors.error,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Erreur: $message',
                            style: common.AppTypography.titleMedium,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<common.CourseBloc>()
                                  .add(const common.CourseEvent.loadCourses());
                            },
                            child: const Text('Réessayer'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const AppFooter(),
                ],
              ),
            ),
          );
        },
      ),
      // Bouton flottant pour filtres sur mobile
      floatingActionButton: isMobile
          ? FloatingActionButton(
              onPressed: _showMobileFiltersDialog,
              child: const Icon(Icons.filter_list),
            )
          : null,
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getHorizontalPadding(context),
        vertical: 32,
      ),
      decoration: BoxDecoration(
        color: common.AppColors.primaryContainer,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: ResponsiveHelper.getMaxContentWidth(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Catalogue de Cours',
                style: common.AppTypography.displaySmall.copyWith(
                  fontWeight: FontWeight.bold,
                  color: common.AppColors.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Découvrez nos formations professionnelles pour électriciens',
                style: common.AppTypography.titleMedium.copyWith(
                  color: common.AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileFilters() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Rechercher un cours...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        onChanged: (query) {
          setState(() => _searchQuery = query);
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Aucun cours trouvé',
            style: common.AppTypography.titleMedium.copyWith(
              color: common.AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Essayez de modifier vos filtres',
            style: common.AppTypography.bodyMedium.copyWith(
              color: common.AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  void _showMobileFiltersDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          child: CourseSidebar(
            onCategoryChanged: (category) {
              setState(() => _selectedCategory = category);
            },
            onLevelChanged: (level) {
              setState(() => _selectedLevel = level);
            },
            onSearchChanged: (query) {
              setState(() => _searchQuery = query);
            },
          ),
        ),
      ),
    );
  }

  List<common.CourseEntity> _filterCourses(List<common.CourseEntity> courses) {
    var filtered = courses;

    // Filtrer par recherche
    if (_searchQuery.isNotEmpty) {
      filtered = filtered
          .where((course) =>
              course.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              course.description.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }

    // Filtrer par niveau
    if (_selectedLevel != null) {
      filtered = filtered.where((course) => course.level == _selectedLevel).toList();
    }

    // Filtrer par catégorie
    if (_selectedCategory != null) {
      filtered = filtered
          .where((course) => course.categoryDisplayName == _selectedCategory)
          .toList();
    }

    return filtered;
  }
}
