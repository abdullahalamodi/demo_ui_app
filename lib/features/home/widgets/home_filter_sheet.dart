import '../../../common_libs.dart';

enum _HomeSortOption { nearest, priceLowToHigh }

enum _HomeDurationOption { sixty, ninety, oneTwenty }

class HomeFilterSheet extends StatefulWidget {
  const HomeFilterSheet({
    this.onApplyPressed,
    super.key,
  });

  final VoidCallback? onApplyPressed;

  @override
  State<HomeFilterSheet> createState() => _HomeFilterSheetState();
}

class _HomeFilterSheetState extends State<HomeFilterSheet> {
  bool _showUnavailableClubs = true;
  bool _trainWithCoach = false;
  _HomeSortOption _sortOption = _HomeSortOption.priceLowToHigh;
  _HomeDurationOption _durationOption = _HomeDurationOption.ninety;
  final Set<String> _selectedTypes = {};

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is! ScrollUpdateNotification) {
      return false;
    }

    final scrollDelta = notification.scrollDelta;
    final isPullingPastTop =
        notification.metrics.pixels <= 0 &&
        scrollDelta != null &&
        scrollDelta < -6;

    if (isPullingPastTop) {
      Navigator.of(context).maybePop();
    }

    return false;
  }

  void _toggleType(String type) {
    setState(() {
      if (_selectedTypes.contains(type)) {
        _selectedTypes.remove(type);
      } else {
        _selectedTypes.add(type);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewPaddingOf(context).bottom;

    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 430,
          maxHeight: context.screenSize.height * .88,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(28),
            ),
          ),
          child: NotificationListener<ScrollNotification>(
            onNotification: _handleScrollNotification,
            child: SingleChildScrollView(
              padding: EdgeInsetsDirectional.fromSTEB(
                24,
                24,
                24,
                bottomInset + 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.loc.homeFilterResults,
                    style: context.textTheme.headlineSmall?.copyWith(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _FilterSectionLabel(label: context.loc.homeAvailability),
                  const SizedBox(height: 14),
                  _SwitchRow(
                    label: context.loc.homeShowNonAvailableClubs,
                    value: _showUnavailableClubs,
                    onChanged: (value) {
                      setState(() => _showUnavailableClubs = value);
                    },
                  ),
                  const SizedBox(height: 18),
                  _FilterSectionLabel(label: context.loc.homeSortBy),
                  const SizedBox(height: 13),
                  _OptionColumn(
                    children: [
                      _RadioOption<_HomeSortOption>(
                        label: context.loc.homeNearest,
                        value: _HomeSortOption.nearest,
                        groupValue: _sortOption,
                        onChanged: (value) {
                          setState(() => _sortOption = value);
                        },
                      ),
                      const SizedBox(height: 8),
                      _RadioOption<_HomeSortOption>(
                        label: context.loc.homePriceLowToHigh,
                        value: _HomeSortOption.priceLowToHigh,
                        groupValue: _sortOption,
                        onChanged: (value) {
                          setState(() => _sortOption = value);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  _FilterSectionLabel(label: context.loc.homeCoach),
                  const SizedBox(height: 14),
                  _SwitchRow(
                    label: context.loc.homeTrainWithCoach,
                    value: _trainWithCoach,
                    onChanged: (value) {
                      setState(() => _trainWithCoach = value);
                    },
                    inactiveThumbColor: const Color(0xFFBDC6C2),
                  ),
                  const SizedBox(height: 18),
                  _FilterSectionLabel(label: context.loc.homeDuration),
                  const SizedBox(height: 16),
                  _OptionWrap(
                    children: [
                      _RadioOption<_HomeDurationOption>(
                        label: context.loc.homeDuration60Min,
                        value: _HomeDurationOption.sixty,
                        groupValue: _durationOption,
                        onChanged: (value) {
                          setState(() => _durationOption = value);
                        },
                      ),
                      _RadioOption<_HomeDurationOption>(
                        label: context.loc.homeDuration90Min,
                        value: _HomeDurationOption.ninety,
                        groupValue: _durationOption,
                        onChanged: (value) {
                          setState(() => _durationOption = value);
                        },
                      ),
                      _RadioOption<_HomeDurationOption>(
                        label: context.loc.homeDuration120Min,
                        value: _HomeDurationOption.oneTwenty,
                        groupValue: _durationOption,
                        onChanged: (value) {
                          setState(() => _durationOption = value);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  _FilterSectionLabel(label: context.loc.homeType),
                  const SizedBox(height: 16),
                  _OptionWrap(
                    children: [
                      _CheckboxOption(
                        label: context.loc.homeIndoor,
                        value: _selectedTypes.contains('indoor'),
                        onChanged: () => _toggleType('indoor'),
                      ),
                      _CheckboxOption(
                        label: context.loc.homeOutdoor,
                        value: _selectedTypes.contains('outdoor'),
                        onChanged: () => _toggleType('outdoor'),
                      ),
                      _CheckboxOption(
                        label: context.loc.homeRoofed,
                        value: _selectedTypes.contains('roofed'),
                        onChanged: () => _toggleType('roofed'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: _FilterActionButton(
                          label: context.loc.homeCancel,
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        flex: 15,
                        child: _FilterActionButton(
                          label: context.loc.homeApply,
                          isPrimary: true,
                          onPressed:
                              widget.onApplyPressed ??
                              () => Navigator.of(context).pop(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FilterSectionLabel extends StatelessWidget {
  const _FilterSectionLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 41,
      alignment: AlignmentDirectional.centerStart,
      padding: const EdgeInsetsDirectional.only(start: 18),
      decoration: BoxDecoration(
        color: const Color(0xFFE7EEEB),
        borderRadius: BorderRadius.circular(kRadiusM),
      ),
      child: Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.textTheme.bodyMedium?.copyWith(
          color: Colors.black,
          fontSize: 12,
        ),
      ),
    );
  }
}

class _SwitchRow extends StatelessWidget {
  const _SwitchRow({
    required this.label,
    required this.value,
    required this.onChanged,
    this.inactiveThumbColor = const Color(0xFFBDC6C2),
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color inactiveThumbColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.black,
              fontSize: 13,
            ),
          ),
        ),
        const SizedBox(width: 16),
        GestureDetector(
          onTap: () => onChanged(!value),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            width: 50,
            height: 29,
            padding: const EdgeInsets.all(4.75),
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: BorderRadius.circular(kRadiusPill),
              border: Border.all(color: const Color(0xFFE8E8E8)),
            ),
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 160),
              alignment: value
                  ? AlignmentDirectional.centerEnd
                  : AlignmentDirectional.centerStart,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: value
                      ? context.colorScheme.primary
                      : inactiveThumbColor,
                  shape: BoxShape.circle,
                ),
                child: const SizedBox.square(dimension: 19.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _OptionColumn extends StatelessWidget {
  const _OptionColumn({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}

class _OptionWrap extends StatelessWidget {
  const _OptionWrap({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 35,
      runSpacing: 16,
      alignment: WrapAlignment.spaceBetween,
      children: children,
    );
  }
}

class _RadioOption<T> extends StatelessWidget {
  const _RadioOption({
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final String label;
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppSelectionMark(isSelected: isSelected),
          const SizedBox(width: 14),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _CheckboxOption extends StatelessWidget {
  const _CheckboxOption({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppSelectionMark(isSelected: value, isSquare: true),
          const SizedBox(width: 14),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterActionButton extends StatelessWidget {
  const _FilterActionButton({
    required this.label,
    required this.onPressed,
    this.isPrimary = false,
  });

  final String label;
  final VoidCallback onPressed;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isPrimary
        ? context.colorScheme.primary
        : context.colorScheme.surface;
    final foregroundColor = isPrimary
        ? context.colorScheme.onPrimary
        : Colors.black;
    final borderColor = isPrimary
        ? context.colorScheme.primary
        : const Color(0xFFD9D6D0);

    return SizedBox(
      height: 52,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kRadiusM),
            side: BorderSide(color: borderColor),
          ),
          textStyle: context.textTheme.titleMedium?.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        child: Text(label),
      ),
    );
  }
}
