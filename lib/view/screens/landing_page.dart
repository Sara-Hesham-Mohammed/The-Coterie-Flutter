import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:the_coterie/view/widgets/atoms/chips.dart';
import 'package:the_coterie/view/widgets/molecules/chip_molecule.dart';

class LandingPageView extends StatefulWidget {
  const LandingPageView({super.key});

  @override
  State<LandingPageView> createState() => _LandingPageViewState();
}

class _LandingPageViewState extends State<LandingPageView> with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  // Questionnaire data
  final Map<String, dynamic> _answers = {};
  final List<String> _selectedInterests = [];
  String _selectedExperience = '';
  String _selectedGoal = '';

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 4, vsync: this); // Increased to 4 pages
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            controller: _pageViewController,
            onPageChanged: _handlePageViewChanged,
            children: <Widget>[
              _buildWelcomePage(textTheme, colorScheme),
              _buildInterestsPage(textTheme, colorScheme),
              _buildExperiencePage(textTheme, colorScheme),
              _buildGoalsPage(textTheme, colorScheme),
            ],
          ),
          PageIndicator(
            tabController: _tabController,
            currentPageIndex: _currentPageIndex,
            onUpdateCurrentPageIndex: _updateCurrentPageIndex,
            isOnDesktopAndWeb: _isOnDesktopAndWeb,
            totalPages: 4,
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomePage(TextTheme textTheme, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.quiz_outlined,
            size: 80,
            color: colorScheme.primary,
          ),
          const SizedBox(height: 32),
          Text(
            'Welcome to The Coterie',
            style: textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Let\'s get to know you better! This quick questionnaire will help us personalize your experience.',
            style: textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          ElevatedButton(
            onPressed: () => _updateCurrentPageIndex(1),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            child: const Text('Get Started'),
          ),
        ],
      ),
    );
  }

  Widget _buildInterestsPage(TextTheme textTheme, ColorScheme colorScheme) {
    final interests = [
      'Technology',
      'Art & Design',
      'Music',
      'Sports',
      'Travel',
      'Food & Cooking',
      'Reading',
      'Gaming',
      'Photography',
      'Fitness',
      'Movies & TV',
      'Nature',
    ];

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'What are your interests?',
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Select all that apply',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  alignment: WrapAlignment.center,
                  children: interests.map((interest) {
                    final isSelected = _selectedInterests.contains(interest);
                    return FilterChip(
                      label: Text(interest),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            _selectedInterests.add(interest);
                          } else {
                            _selectedInterests.remove(interest);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => _updateCurrentPageIndex(0),
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  onPressed: _selectedInterests.isNotEmpty
                      ? () => _updateCurrentPageIndex(2)
                      : null,
                  child: const Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExperiencePage(TextTheme textTheme, ColorScheme colorScheme) {
    final experiences = [
      'Complete Beginner',
      'Some Experience',
      'Intermediate',
      'Advanced',
      'Expert',
    ];

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'What\'s your experience level?',
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Select your overall experience level',
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: ListView.builder(
              itemCount: experiences.length,
              itemBuilder: (context, index) {
                final experience = experiences[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: RadioListTile<String>(
                    title: Text(experience),
                    value: experience,
                    groupValue: _selectedExperience,
                    onChanged: (value) {
                      setState(() {
                        _selectedExperience = value!;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => _updateCurrentPageIndex(1),
                child: const Text('Back'),
              ),
              ElevatedButton(
                onPressed: _selectedExperience.isNotEmpty
                    ? () => _updateCurrentPageIndex(3)
                    : null,
                child: const Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGoalsPage(TextTheme textTheme, ColorScheme colorScheme) {
    const goals = [
      'Improve communication skills',
      'Build meaningful relationships',
      'Develop empathy and emotional intelligence',
      'Expand social circle',
      'Gain confidence in social settings',
      'Strengthen teamwork and collaboration',
      'Enhance active listening skills',
      'Foster a sense of community',
      'Open up to new experiences',
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'What\'s your main goal?',
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'What do you hope to achieve?',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView.builder(
                itemCount: goals.length,
                itemBuilder: (context, index) {
                  final goal = goals[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: RadioListTile<String>(
                      title: Text(goal),
                      value: goal,
                      groupValue: _selectedGoal,
                      onChanged: (value) {
                        setState(() {
                          _selectedGoal = value!;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => _updateCurrentPageIndex(2),
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  onPressed: _selectedGoal.isNotEmpty
                      ? _completeQuestionnaire
                      : null,
                  child: const Text('Complete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _completeQuestionnaire() {
    // Store all answers
    _answers['interests'] = _selectedInterests;
    _answers['experience'] = _selectedExperience;
    _answers['goal'] = _selectedGoal;

    // Show completion dialog or navigate to next screen
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Questionnaire Complete!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Thank you for completing the questionnaire.'),
            const SizedBox(height: 16),
            Text('Interests: ${_selectedInterests.join(', ')}'),
            const SizedBox(height: 8),
            Text('Experience: $_selectedExperience'),
            const SizedBox(height: 8),
            Text('Goal: $_selectedGoal'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Navigate to main app or next screen
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    if (!_isOnDesktopAndWeb) {
      return;
    }
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  bool get _isOnDesktopAndWeb =>
      kIsWeb ||
          switch (defaultTargetPlatform) {
            TargetPlatform.macOS || TargetPlatform.linux || TargetPlatform.windows => true,
            TargetPlatform.android || TargetPlatform.iOS || TargetPlatform.fuchsia => false,
          };
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
    required this.isOnDesktopAndWeb,
    required this.totalPages,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;
  final bool isOnDesktopAndWeb;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    if (!isOnDesktopAndWeb) {
      return const SizedBox.shrink();
    }
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (currentPageIndex == 0) {
                return;
              }
              onUpdateCurrentPageIndex(currentPageIndex - 1);
            },
            icon: const Icon(Icons.arrow_left_rounded, size: 32.0),
          ),
          TabPageSelector(
            controller: tabController,
            color: colorScheme.surface,
            selectedColor: colorScheme.primary,
          ),
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (currentPageIndex == totalPages - 1) {
                return;
              }
              onUpdateCurrentPageIndex(currentPageIndex + 1);
            },
            icon: const Icon(Icons.arrow_right_rounded, size: 32.0),
          ),
        ],
      ),
    );
  }
}