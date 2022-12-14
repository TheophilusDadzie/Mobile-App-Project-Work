// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:home_work/models/auction.dart';
import 'package:home_work/utils/extensions.dart';
import 'package:home_work/widgets/auctionPage.dart';

class AuctionItemTile extends StatelessWidget {
  final Auction auction;
  const AuctionItemTile({super.key, required this.auction});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AuctionPage(auction: auction),
          ),
        ),
        child: Container(
          width: context.width * 0.8,
          decoration: BoxDecoration(
            border: Border.all(color: context.theme.disabledColor),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(TablerIcons.brand_sentry),
                      SizedBox(width: 12),
                      Text(
                        auction.tag,
                        style: context.theme.textTheme.subtitle1?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '@${auction.artist}',
                    style: context.theme.textTheme.subtitle1?.copyWith(
                      color: context.colorScheme.onBackground.withOpacity(0.67),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: context.theme.disabledColor.withOpacity(0.1),
                  ),
                  child: Hero(
                    tag: auction.imageUrl,
                    child: CachedNetworkImage(
                      imageUrl: auction.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              /// bottom section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '20h: 35min: 08s',
                        style: context.theme.textTheme.subtitle1
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Remaining Time',
                        style: context.theme.textTheme.subtitle2?.copyWith(
                          color: context.colorScheme.onBackground
                              .withOpacity(0.67),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${(auction.bid * 1.58).toStringAsFixed(2)}H ETH',
                        style: context.theme.textTheme.subtitle1
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Higher bid',
                        style: context.theme.textTheme.subtitle2?.copyWith(
                          color: context.colorScheme.onBackground
                              .withOpacity(0.67),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
