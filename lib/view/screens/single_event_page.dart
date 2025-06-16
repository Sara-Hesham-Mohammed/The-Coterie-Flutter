import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_coterie/view/widgets/countdown.dart';
import '../../../view_models/event_view_model.dart';
import '../../model/entities/Event.dart';
import '../../utils/msg_snackbar.dart';
import '../widgets/molecules/event_detail_section.dart';
import '../widgets/molecules/group_members_section.dart';
import '../widgets/molecules/hero_carousel.dart';
import '../widgets/pending.dart';

class EventPage extends StatefulWidget {
  final Event event;
  const EventPage({super.key, required this.event});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> with TickerProviderStateMixin {
  bool _hasRSVPed = false;
  bool _showTimer = false;
  bool _showGroup = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  // Timer target date - set this to your desired countdown end time
  late DateTime _timerTargetDate;

  @override
  void initState() {
    super.initState();

    //1 minute from now for testing
    _timerTargetDate = DateTime.now().add(Duration(minutes: 1));

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTimerEnd() {
    setState(() {
      _showTimer = false;
      _showGroup = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(''),
                background: HeroImageCarousel(
                  imgs: widget.event.imagesSrcs,
                  eventId: widget.event.id?.toString() ?? '0',
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Column(
                    children: [
                      EventDetailsSection(event: widget.event),

                      // Conditional rendering based on RSVP status
                      if (_hasRSVPed && _showTimer) ...[
                        Container(
                          margin: EdgeInsets.all(16),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surfaceVariant,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Group matching in progress...',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                                ),
                              ),
                              SizedBox(height: 12),
                              CountdownWidget(
                                targetDate: _timerTargetDate,
                                onTimerEnd: _onTimerEnd,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Please wait while we find your perfect group!',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.7),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],

                      if (_hasRSVPed && _showGroup) ...[
                        Container(
                          margin: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your Group',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 12),
                              GroupMembersSection(),
                            ],
                          ),
                        ),
                      ],

                      if (!_hasRSVPed) ...[
                        Container(
                          margin: EdgeInsets.all(16),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                            ),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.group_add,
                                size: 48,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              SizedBox(height: 12),
                              Text(
                                'Ready to join?',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurface,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'RSVP now and get matched with an amazing group!',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],


                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 16.0,
          left: screenSize.width * 0.20,
          child: FloatingActionButton.extended(
            onPressed: _hasRSVPed ? null : () {
              _showRSVPDialog(context);
            },
            label: Text(_hasRSVPed ? 'RSVP\'d' : 'RSVP'),
            backgroundColor: _hasRSVPed
                ? Theme.of(context).colorScheme.surfaceVariant
                : Theme.of(context).colorScheme.primary,
            foregroundColor: _hasRSVPed
                ? Theme.of(context).colorScheme.onSurfaceVariant
                : Theme.of(context).colorScheme.onPrimary,
            extendedPadding:
            const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
          ),
        ),
      ],
    );
  }

  void _showRSVPDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Wanna go?'),
        content: const Text('RSVP and get matched with a group.'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              SnackBarUtils.showSnackBar(context, 'RSVP confirmed! Finding your group...');

              // Handle RSVP confirmation
              setState(() {
                _hasRSVPed = true;
                _showTimer = true;
                _showGroup = false;
              });
            },
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('No'),
          ),
        ],
      ),
    );
  }
}