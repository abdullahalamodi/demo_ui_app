import '../../../common_libs.dart';

class HomeCourtHomeTab extends StatelessWidget {
  const HomeCourtHomeTab({
    required this.venue,
    super.key,
  });

  final HomeCourtVenue venue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CourtGallery(venue: venue),
        const SizedBox(height: 24),
        _AmenityRail(amenities: venue.amenities),
        const SizedBox(height: 26),
        _DescriptionPanel(description: venue.description),
        const SizedBox(height: 28),
        _StatsRow(venue: venue),
        const SizedBox(height: 28),
      ],
    );
  }
}

class _CourtGallery extends StatelessWidget {
  const _CourtGallery({required this.venue});

  final HomeCourtVenue venue;

  @override
  Widget build(BuildContext context) {
    final assets = venue.galleryAssets;

    return SizedBox(
      height: 165,
      child: Row(
        children: [
          Expanded(
            child: _GalleryImage(
              asset: assets.first,
              borderRadius: BorderRadius.circular(kRadiusS),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 100,
            child: Column(
              children: [
                Expanded(
                  child: _GalleryImage(
                    asset: assets.length > 1 ? assets[1] : assets.first,
                    borderRadius: BorderRadius.circular(kRadiusS),
                  ),
                ),
                const SizedBox(height: 7),
                Expanded(
                  child: _GalleryImage(
                    asset: assets.length > 2 ? assets[2] : assets.first,
                    borderRadius: BorderRadius.circular(kRadiusS),
                    overlayText: '+10',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GalleryImage extends StatelessWidget {
  const _GalleryImage({
    required this.asset,
    required this.borderRadius,
    this.overlayText,
  });

  final String asset;
  final BorderRadius borderRadius;
  final String? overlayText;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            asset,
            fit: BoxFit.cover,
          ),
          if (overlayText != null) ...[
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black45,
              ),
            ),
            Center(
              child: Text(
                overlayText!,
                style: context.textTheme.headlineSmall?.copyWith(
                  fontSize: 17,
                  color: context.customColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _AmenityRail extends StatelessWidget {
  const _AmenityRail({required this.amenities});

  final List<HomeCourtAmenity> amenities;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var index = 0; index < amenities.length; index++) ...[
          Expanded(child: _AmenityItem(amenity: amenities[index])),
          if (index != amenities.length - 1)
            SizedBox(
              height: 16,
              child: VerticalDivider(
                color: context.colorScheme.outlineVariant,
                thickness: 1,
                width: 1,
              ),
            ),
        ],
      ],
    );
  }
}

class _AmenityItem extends StatelessWidget {
  const _AmenityItem({required this.amenity});

  final HomeCourtAmenity amenity;

  @override
  Widget build(BuildContext context) {
    final svgAsset = _svgAsset;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (svgAsset == null)
          FaIcon(
            amenity.icon,
            size: 24,
            color: context.customColors.iconMuted,
          )
        else
          AppSvgIcon(
            svgAsset,
            size: 24,
            color: context.customColors.iconMuted,
          ),
        const SizedBox(height: 10),
        Text(
          _label(context),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.bodyMedium?.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  String? get _svgAsset {
    return switch (amenity.type) {
      HomeCourtAmenityType.racket => FixedAssets.tennisRacket,
      HomeCourtAmenityType.ball => FixedAssets.tennisBall,
      HomeCourtAmenityType.shower ||
      HomeCourtAmenityType.toilet ||
      HomeCourtAmenityType.water => null,
    };
  }

  String _label(BuildContext context) {
    return switch (amenity.type) {
      HomeCourtAmenityType.racket => context.loc.homeCourtAmenityRacket,
      HomeCourtAmenityType.ball => context.loc.homeCourtAmenityBall,
      HomeCourtAmenityType.shower => context.loc.homeCourtAmenityShower,
      HomeCourtAmenityType.toilet => context.loc.homeCourtAmenityToilet,
      HomeCourtAmenityType.water => context.loc.homeCourtAmenityWater,
    };
  }
}

class _DescriptionPanel extends StatelessWidget {
  const _DescriptionPanel({required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.customColors.surfaceTinted,
        borderRadius: BorderRadius.circular(kRadiusM),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(14, 17, 14, 17),
        child: Text(
          description,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium?.copyWith(
            fontSize: 11,
            height: 1.55,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow({required this.venue});

  final HomeCourtVenue venue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatItem(
            label: context.loc.homeCourtRating,
            value: venue.detailRatingText,
          ),
        ),
        Expanded(
          child: _StatItem(
            label: context.loc.homeType,
            value: venue.isIndoor
                ? context.loc.homeIndoor
                : context.loc.homeOutdoor,
          ),
        ),
        Expanded(
          child: _StatItem(
            label: context.loc.homeCourtDistance,
            value: venue.detailDistanceText,
          ),
        ),
        Expanded(
          child: _StatItem(
            label: context.loc.homeCourtZone,
            value: venue.zone,
          ),
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.bodyMedium?.copyWith(
            fontSize: 13,
            color: context.customColors.onSurfaceSubtle,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.titleMedium?.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
