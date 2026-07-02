import '../../../common_libs.dart';

class ShowHomeCourtPage extends StatefulWidget {
  const ShowHomeCourtPage({
    required this.id,
    super.key,
  });

  final String id;

  static void go(BuildContext context, String id) {
    context.push(AppRoutes.showHomeCourt(id));
  }

  @override
  State<ShowHomeCourtPage> createState() => _ShowHomeCourtPageState();
}

class _ShowHomeCourtPageState extends State<ShowHomeCourtPage> {
  HomeCourtDetailTab _selectedTab = HomeCourtDetailTab.home;
  bool _isFavorite = false;

  void _handleBack() {
    if (context.canPop()) {
      context.pop();
      return;
    }

    HomePage.go(context);
  }

  void _toggleFavorite() {
    setState(() => _isFavorite = !_isFavorite);
  }

  void _selectTab(HomeCourtDetailTab tab) {
    setState(() => _selectedTab = tab);
  }

  @override
  Widget build(BuildContext context) {
    final venue = HomeCourtVenue.demoById(widget.id);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Align(
          alignment: AlignmentDirectional.topCenter,
          child: ShowHomeCourtContent(
            venue: venue,
            selectedTab: _selectedTab,
            isFavorite: _isFavorite,
            onBackPressed: _handleBack,
            onFavoritePressed: _toggleFavorite,
            onSharePressed: () {},
            onTabSelected: _selectTab,
            onCancelPressed: _handleBack,
            onBookPressed: () {},
            onSubscriptionPressed: () {},
          ),
        ),
      ),
    );
  }
}
