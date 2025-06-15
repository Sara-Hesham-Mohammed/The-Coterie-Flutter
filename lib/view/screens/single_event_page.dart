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
  bool _showWidget = false;
  bool _showTimer = false;
  bool _showGroup = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
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
                      if (_showWidget) Pending(),
                      GroupMembersSection(),
                      Text("SHOWING WIDGET"),
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
            onPressed: () {
              _showRSVPDialog(context);
            },
            label: const Text('RSVP'),
            backgroundColor: Theme.of(context).colorScheme.primary,
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
              SnackBarUtils.showSnackBar(context, 'RSVP confirmed!');

              // TODO: HANDLE CLUSTERING AND CHANGE THE SCREEN
             // if(_showWidget){
             //   if(CountdownWidget.hasEnded)
             // }

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

  void _showGroupWidget() {
    setState(() {
      _showGroup = !_showGroup;
    });
  }

  void _showTimerWidget() {
    setState(() {
      _showTimer = !_showTimer;
    });
  }
}
